import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:security_center/disk_encryption/disk_encryption_l10n.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:yaru/icons.dart';

// TODO: this will need to be conditionally hooked up to the /storage/v2/calculate_entropy
//       endpoint in Subiquity once it is available
class CurrentPassphraseFormField extends ConsumerStatefulWidget {
  const CurrentPassphraseFormField({
    required this.authMode,
    super.key,
    this.fieldWidth,
  });

  final double? fieldWidth;
  final AuthMode authMode;

  @override
  ConsumerState<CurrentPassphraseFormField> createState() =>
      _CurrentPassphraseFormFieldState();
}

class _CurrentPassphraseFormFieldState
    extends ConsumerState<CurrentPassphraseFormField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    final model = ref.read(changeAuthDialogModelProvider);
    assert(widget.authMode != AuthMode.none);

    super.initState();
    _controller.value = _controller.value.copyWith(text: model.oldPass);
    if (widget.authMode == AuthMode.pin) {
      _controller.addListener(() => _filterDigits(_controller));
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(changeAuthDialogModelProvider);
    final notifier = ref.watch(changeAuthDialogModelProvider.notifier);
    final lang = AppLocalizations.of(context);
    final isDisabled = model.dialogState is ChangeAuthDialogStateSuccess;

    return ValidatedFormField(
      controller: _controller,
      fieldWidth: widget.fieldWidth,
      labelText: widget.authMode.localizedCurrentHint(lang),
      obscureText: !model.showPassphrase,
      suffixIcon: const _SecurityKeyShowButton(),
      enabled: !isDisabled,
      validator: RequiredValidator(
        errorText: widget.authMode.localizedCurrentError(lang),
      ),
      onChanged: (value) {
        notifier.oldPass = value;
      },
    );
  }
}

class PassphraseFormField extends ConsumerStatefulWidget {
  const PassphraseFormField({
    required this.authMode,
    super.key,
    this.fieldWidth,
  });

  final double? fieldWidth;
  final AuthMode authMode;

  @override
  ConsumerState<PassphraseFormField> createState() =>
      _PassphraseFormFieldState();
}

class _PassphraseFormFieldState extends ConsumerState<PassphraseFormField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    final model = ref.read(changeAuthDialogModelProvider);
    assert(widget.authMode != AuthMode.none);

    super.initState();
    _controller.value = _controller.value.copyWith(text: model.newPass);
    if (widget.authMode == AuthMode.pin) {
      _controller.addListener(() => _filterDigits(_controller));
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(changeAuthDialogModelProvider);
    final notifier = ref.watch(changeAuthDialogModelProvider.notifier);
    final lang = AppLocalizations.of(context);
    final isDisabled = model.dialogState is ChangeAuthDialogStateSuccess;

    return ValidatedFormField(
      controller: _controller,
      fieldWidth: widget.fieldWidth,
      labelText: widget.authMode.localizedNewHint(lang),
      obscureText: !model.showPassphrase,
      suffixIcon: const _SecurityKeyShowButton(),
      enabled: !isDisabled,
      validator: MultiValidator([
        RequiredValidator(errorText: widget.authMode.localizedNewError(lang)),
        MinLengthValidator(
          4,
          errorText: widget.authMode.localizedNewError(lang),
        ),
      ]),
      onChanged: (value) {
        notifier.newPass = value;
      },
    );
  }
}

class ConfirmPassphraseFormField extends ConsumerStatefulWidget {
  const ConfirmPassphraseFormField({
    required this.authMode,
    this.fieldWidth,
    super.key,
  });

  final double? fieldWidth;
  final AuthMode authMode;

  @override
  ConsumerState<ConfirmPassphraseFormField> createState() =>
      _ConfirmPassphraseFormFieldState();
}

class _ConfirmPassphraseFormFieldState
    extends ConsumerState<ConfirmPassphraseFormField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    final model = ref.read(changeAuthDialogModelProvider);
    assert(widget.authMode != AuthMode.none);

    super.initState();
    _controller.value = _controller.value.copyWith(text: model.confirmPass);
    if (widget.authMode == AuthMode.pin) {
      _controller.addListener(() => _filterDigits(_controller));
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(changeAuthDialogModelProvider);
    final notifier = ref.watch(changeAuthDialogModelProvider.notifier);
    final lang = AppLocalizations.of(context);
    final isDisabled = model.dialogState is ChangeAuthDialogStateSuccess;

    return ValidatedFormField(
      controller: _controller,
      fieldWidth: widget.fieldWidth,
      labelText: widget.authMode.localizedConfirmHint(lang),
      obscureText: !model.showPassphrase,
      suffixIcon: const _SecurityKeyShowButton(),
      enabled: !isDisabled,
      validator: EqualValidator(
        model.newPass,
        errorText: widget.authMode.localizedConfirmError(lang),
      ),
      onChanged: (value) {
        notifier.confirmPass = value;
      },
    );
  }
}

void _filterDigits(TextEditingController controller) {
  final filteredInput = controller.text.replaceAll(RegExp('[^0-9]'), '');
  final newSelection = TextSelection(
    baseOffset: min(controller.selection.baseOffset, filteredInput.length),
    extentOffset: min(controller.selection.extentOffset, filteredInput.length),
  );
  controller.value = controller.value.copyWith(
    text: filteredInput,
    selection: newSelection,
  );
}

class _SecurityKeyShowButton extends ConsumerWidget {
  const _SecurityKeyShowButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context);
    final model = ref.watch(changeAuthDialogModelProvider);
    final notifier = ref.read(changeAuthDialogModelProvider.notifier);
    final showSecurityKey = model.showPassphrase;
    final isDisabled = model.dialogState is ChangeAuthDialogStateSuccess;

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: TextButton.icon(
        icon: Icon(
          showSecurityKey ? YaruIcons.eye : YaruIcons.hide,
          color: isDisabled
              ? theme.disabledColor
              : theme.colorScheme.onSecondaryContainer,
        ),
        label: Text(
          showSecurityKey
              ? lang.recoveryKeyPassphraseHide
              : lang.recoveryKeyPassphraseShow,
        ),
        onPressed: notifier.toggleShowPassphrase,
        style: TextButton.styleFrom(
          foregroundColor: isDisabled
              ? theme.disabledColor
              : theme.colorScheme.onSecondaryContainer,
          backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4.0),
              bottomRight: Radius.circular(4.0),
            ),
          ),
        ),
      ),
    );
  }
}
