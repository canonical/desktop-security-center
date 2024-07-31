import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prompting_client/prompting_client.dart';
import 'package:prompting_client_ui/prompt_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'home_prompt_data_model.freezed.dart';
part 'home_prompt_data_model.g.dart';

@freezed
class HomePromptData with _$HomePromptData {
  factory HomePromptData({
    required PromptDetailsHome details,
    required List<Permission> permissions,
    required String customPath,
    PatternOption? patternOption,
    @Default(Action.allow) Action? action,
    @Default(Lifespan.forever) Lifespan? lifespan,
    String? errorMessage,
  }) = _HomePromptData;

  HomePromptData._();

  String? get pathPattern => switch (patternOption?.homePatternType) {
        HomePatternType.customPath => customPath,
        _ => patternOption?.pathPattern,
      };

  int get numPatternOptions => details.patternOptions.length;

  (HomePatternType, String) moreOptionPath(int index) {
    final opt = details.patternOptions[index];
    return (opt.homePatternType, opt.pathPattern);
  }

  bool get isValid =>
      pathPattern != null &&
      action != null &&
      lifespan != null &&
      permissions.isNotEmpty;
}

@riverpod
class HomePromptDataModel extends _$HomePromptDataModel {
  @override
  HomePromptData build() {
    final details = ref.watch(currentPromptProvider) as PromptDetailsHome;
    return HomePromptData(
      details: details,
      patternOption: details.patternOptions.isEmpty
          ? PatternOption(
              homePatternType: HomePatternType.customPath,
              pathPattern: '',
            )
          : details.patternOptions[details.initialPatternOption
              .clamp(0, details.patternOptions.length - 1)],
      permissions: details.initialPermissions,
      customPath: details.requestedPath,
    );
  }

  PromptReply buildReply() {
    return PromptReply.home(
      promptId: state.details.metaData.promptId,
      action: state.action!,
      lifespan: state.lifespan!,
      pathPattern: state.pathPattern!,
      permissions: state.permissions,
    );
  }

  void setPatternOption(PatternOption? patternOption) =>
      state = state.copyWith(patternOption: patternOption);

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

  Future<PromptReplyResponse> saveAndContinue() async {
    final response =
        await getService<PromptingClient>().replyToPrompt(buildReply());
    if (response is PromptReplyResponseUnknown) {
      state = state.copyWith(errorMessage: response.message);
    }
    return response;
  }
}
