import 'package:apparmor_prompt/widgets/markdown_text.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class RadioButtonList<T> extends StatelessWidget {
  const RadioButtonList({
    required this.title,
    required this.options,
    required this.optionTitle,
    required this.groupValue,
    this.onChanged,
    this.optionSubtitle,
    this.toggleable = false,
    super.key,
  });

  final String title;
  final Iterable<T> options;
  final String Function(T option) optionTitle;
  final String Function(T option)? optionSubtitle;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final bool toggleable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownText(title.bold()),
        const SizedBox(height: 10),
        for (final option in options) ...[
          YaruRadioButton<T>(
            value: option,
            groupValue: groupValue,
            onChanged: onChanged,
            title: Text(optionTitle(option)),
            subtitle: optionSubtitle != null
                ? Text(
                    optionSubtitle!(option),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                  )
                : null,
            toggleable: toggleable,
          ),
        ],
      ],
    );
  }
}

class CheckButtonList<T> extends StatelessWidget {
  const CheckButtonList({
    required this.title,
    required this.options,
    required this.optionTitle,
    required this.hasOption,
    required this.isEnabled,
    required this.toggleOption,
    super.key,
  });

  final String title;
  final Iterable<T> options;
  final String Function(T option) optionTitle;
  final bool Function(T option) hasOption;
  final bool Function(T option) isEnabled;
  final void Function(T option) toggleOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownText(title.bold()),
        const SizedBox(height: 10),
        for (final option in options) ...[
          YaruCheckButton(
            value: hasOption(option),
            onChanged: isEnabled(option) ? (_) => toggleOption(option) : null,
            title: Text(optionTitle(option)),
          ),
        ],
      ],
    );
  }
}
