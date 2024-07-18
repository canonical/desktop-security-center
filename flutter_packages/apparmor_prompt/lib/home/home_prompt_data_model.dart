import 'dart:io';

import 'package:apparmor_prompt/prompt_model.dart';
import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'home_prompt_data_model.freezed.dart';
part 'home_prompt_data_model.g.dart';

@freezed
class HomePromptData with _$HomePromptData {
  factory HomePromptData({
    required PromptDetailsHome details,
    required bool withMoreOptions,
    required List<Permission> permissions,
    required String customPath,
    @Default(0) int? selectedPath,
    @Default(Action.allow) Action? action,
    @Default(Lifespan.forever) Lifespan? lifespan,
    String? errorMessage,
  }) = _HomePromptData;

  HomePromptData._();

  String get pathPattern {
    if (selectedPath! == numMoreOptions) {
      return customPath;
    } else {
      return details.moreOptions[selectedPath!].pathPattern;
    }
  }

  int get numMoreOptions => details.moreOptions.length;

  (HomePatternType, String) moreOptionPath(int index) {
    final opt = details.moreOptions[index];
    return (opt.homePatternType, opt.pathPattern);
  }

  bool get isValid =>
      selectedPath != null && action != null && lifespan != null;
}

@riverpod
class HomePromptDataModel extends _$HomePromptDataModel {
  @override
  HomePromptData build() {
    final details = ref.watch(currentPromptProvider) as PromptDetailsHome;
    return HomePromptData(
      details: details,
      // forcing for now while we are iterating on what options we provide
      withMoreOptions: true,
      permissions: details.requestedPermissions,
      customPath: details.requestedPath,
    );
  }

  PromptReply buildReply() {
    return PromptReply.home(
      promptId: state.details.metaData.promptId,
      action: state.action!,
      lifespan: state.lifespan!,
      pathPattern: state.pathPattern,
      permissions: state.permissions,
    );
  }

  void toggleMoreOptions() =>
      state = state.copyWith(withMoreOptions: !state.withMoreOptions);

  void setSelectedPath(int? i) => state = state.copyWith(selectedPath: i);

  void setCustomPath(String path) =>
      state = state.copyWith(customPath: path, errorMessage: null);

  void setAction(Action? a) => state = state.copyWith(action: a);

  void setLifespan(Lifespan? l) => state = state.copyWith(lifespan: l);

  void togglePerm(Permission p) {
    if (!state.details.availablePermissions.contains(p)) {
      throw ArgumentError('$p is not an available permission');
    }

    final permissions = [...state.permissions];

    if (permissions.contains(p)) {
      permissions.remove(p);
    } else {
      permissions.add(p);
    }

    state = state.copyWith(permissions: permissions);
  }

  Future<void> saveAndContinue() async {
    final response =
        await getService<AppArmorPromptingClient>().replyToPrompt(buildReply());
    switch (response) {
      case PromptReplyResponseSuccess():
        exit(0);
      case PromptReplyResponseUnknown(message: final message):
        state = state.copyWith(errorMessage: message);
        return;
    }
  }
}
