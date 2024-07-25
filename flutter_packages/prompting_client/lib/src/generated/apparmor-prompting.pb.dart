//
//  Generated code. Do not modify.
//  source: apparmor-prompting.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'apparmor-prompting.pbenum.dart';

export 'apparmor-prompting.pbenum.dart';

enum PromptReply_PromptReply {
  homePromptReply, 
  notSet
}

class PromptReply extends $pb.GeneratedMessage {
  factory PromptReply({
    $core.String? promptId,
    Action? action,
    Lifespan? lifespan,
    HomePromptReply? homePromptReply,
  }) {
    final $result = create();
    if (promptId != null) {
      $result.promptId = promptId;
    }
    if (action != null) {
      $result.action = action;
    }
    if (lifespan != null) {
      $result.lifespan = lifespan;
    }
    if (homePromptReply != null) {
      $result.homePromptReply = homePromptReply;
    }
    return $result;
  }
  PromptReply._() : super();
  factory PromptReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromptReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, PromptReply_PromptReply> _PromptReply_PromptReplyByTag = {
    4 : PromptReply_PromptReply.homePromptReply,
    0 : PromptReply_PromptReply.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromptReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'apparmor_prompting'), createEmptyInstance: create)
    ..oo(0, [4])
    ..aOS(1, _omitFieldNames ? '' : 'promptId')
    ..e<Action>(2, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: Action.ALLOW, valueOf: Action.valueOf, enumValues: Action.values)
    ..e<Lifespan>(3, _omitFieldNames ? '' : 'lifespan', $pb.PbFieldType.OE, defaultOrMaker: Lifespan.SINGLE, valueOf: Lifespan.valueOf, enumValues: Lifespan.values)
    ..aOM<HomePromptReply>(4, _omitFieldNames ? '' : 'homePromptReply', subBuilder: HomePromptReply.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromptReply clone() => PromptReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromptReply copyWith(void Function(PromptReply) updates) => super.copyWith((message) => updates(message as PromptReply)) as PromptReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromptReply create() => PromptReply._();
  PromptReply createEmptyInstance() => create();
  static $pb.PbList<PromptReply> createRepeated() => $pb.PbList<PromptReply>();
  @$core.pragma('dart2js:noInline')
  static PromptReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromptReply>(create);
  static PromptReply? _defaultInstance;

  PromptReply_PromptReply whichPromptReply() => _PromptReply_PromptReplyByTag[$_whichOneof(0)]!;
  void clearPromptReply() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get promptId => $_getSZ(0);
  @$pb.TagNumber(1)
  set promptId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPromptId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPromptId() => clearField(1);

  @$pb.TagNumber(2)
  Action get action => $_getN(1);
  @$pb.TagNumber(2)
  set action(Action v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearAction() => clearField(2);

  @$pb.TagNumber(3)
  Lifespan get lifespan => $_getN(2);
  @$pb.TagNumber(3)
  set lifespan(Lifespan v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLifespan() => $_has(2);
  @$pb.TagNumber(3)
  void clearLifespan() => clearField(3);

  @$pb.TagNumber(4)
  HomePromptReply get homePromptReply => $_getN(3);
  @$pb.TagNumber(4)
  set homePromptReply(HomePromptReply v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasHomePromptReply() => $_has(3);
  @$pb.TagNumber(4)
  void clearHomePromptReply() => clearField(4);
  @$pb.TagNumber(4)
  HomePromptReply ensureHomePromptReply() => $_ensure(3);
}

class PromptReplyResponse extends $pb.GeneratedMessage {
  factory PromptReplyResponse({
    PromptReplyResponse_PromptReplyType? promptReplyType,
    $core.String? message,
  }) {
    final $result = create();
    if (promptReplyType != null) {
      $result.promptReplyType = promptReplyType;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  PromptReplyResponse._() : super();
  factory PromptReplyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromptReplyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromptReplyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'apparmor_prompting'), createEmptyInstance: create)
    ..e<PromptReplyResponse_PromptReplyType>(1, _omitFieldNames ? '' : 'promptReplyType', $pb.PbFieldType.OE, defaultOrMaker: PromptReplyResponse_PromptReplyType.SUCCESS, valueOf: PromptReplyResponse_PromptReplyType.valueOf, enumValues: PromptReplyResponse_PromptReplyType.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromptReplyResponse clone() => PromptReplyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromptReplyResponse copyWith(void Function(PromptReplyResponse) updates) => super.copyWith((message) => updates(message as PromptReplyResponse)) as PromptReplyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromptReplyResponse create() => PromptReplyResponse._();
  PromptReplyResponse createEmptyInstance() => create();
  static $pb.PbList<PromptReplyResponse> createRepeated() => $pb.PbList<PromptReplyResponse>();
  @$core.pragma('dart2js:noInline')
  static PromptReplyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromptReplyResponse>(create);
  static PromptReplyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PromptReplyResponse_PromptReplyType get promptReplyType => $_getN(0);
  @$pb.TagNumber(1)
  set promptReplyType(PromptReplyResponse_PromptReplyType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPromptReplyType() => $_has(0);
  @$pb.TagNumber(1)
  void clearPromptReplyType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

enum GetCurrentPromptResponse_Prompt {
  homePrompt, 
  notSet
}

class GetCurrentPromptResponse extends $pb.GeneratedMessage {
  factory GetCurrentPromptResponse({
    HomePrompt? homePrompt,
  }) {
    final $result = create();
    if (homePrompt != null) {
      $result.homePrompt = homePrompt;
    }
    return $result;
  }
  GetCurrentPromptResponse._() : super();
  factory GetCurrentPromptResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCurrentPromptResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, GetCurrentPromptResponse_Prompt> _GetCurrentPromptResponse_PromptByTag = {
    1 : GetCurrentPromptResponse_Prompt.homePrompt,
    0 : GetCurrentPromptResponse_Prompt.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCurrentPromptResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'apparmor_prompting'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<HomePrompt>(1, _omitFieldNames ? '' : 'homePrompt', subBuilder: HomePrompt.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCurrentPromptResponse clone() => GetCurrentPromptResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCurrentPromptResponse copyWith(void Function(GetCurrentPromptResponse) updates) => super.copyWith((message) => updates(message as GetCurrentPromptResponse)) as GetCurrentPromptResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentPromptResponse create() => GetCurrentPromptResponse._();
  GetCurrentPromptResponse createEmptyInstance() => create();
  static $pb.PbList<GetCurrentPromptResponse> createRepeated() => $pb.PbList<GetCurrentPromptResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentPromptResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCurrentPromptResponse>(create);
  static GetCurrentPromptResponse? _defaultInstance;

  GetCurrentPromptResponse_Prompt whichPrompt() => _GetCurrentPromptResponse_PromptByTag[$_whichOneof(0)]!;
  void clearPrompt() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  HomePrompt get homePrompt => $_getN(0);
  @$pb.TagNumber(1)
  set homePrompt(HomePrompt v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHomePrompt() => $_has(0);
  @$pb.TagNumber(1)
  void clearHomePrompt() => clearField(1);
  @$pb.TagNumber(1)
  HomePrompt ensureHomePrompt() => $_ensure(0);
}

class HomePromptReply extends $pb.GeneratedMessage {
  factory HomePromptReply({
    $core.String? pathPattern,
    $core.Iterable<$core.String>? permissions,
  }) {
    final $result = create();
    if (pathPattern != null) {
      $result.pathPattern = pathPattern;
    }
    if (permissions != null) {
      $result.permissions.addAll(permissions);
    }
    return $result;
  }
  HomePromptReply._() : super();
  factory HomePromptReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomePromptReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomePromptReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'apparmor_prompting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pathPattern')
    ..pPS(2, _omitFieldNames ? '' : 'permissions')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomePromptReply clone() => HomePromptReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomePromptReply copyWith(void Function(HomePromptReply) updates) => super.copyWith((message) => updates(message as HomePromptReply)) as HomePromptReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePromptReply create() => HomePromptReply._();
  HomePromptReply createEmptyInstance() => create();
  static $pb.PbList<HomePromptReply> createRepeated() => $pb.PbList<HomePromptReply>();
  @$core.pragma('dart2js:noInline')
  static HomePromptReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomePromptReply>(create);
  static HomePromptReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pathPattern => $_getSZ(0);
  @$pb.TagNumber(1)
  set pathPattern($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPathPattern() => $_has(0);
  @$pb.TagNumber(1)
  void clearPathPattern() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get permissions => $_getList(1);
}

class HomePrompt_MoreOption extends $pb.GeneratedMessage {
  factory HomePrompt_MoreOption({
    HomePatternType? homePatternType,
    $core.String? pathPattern,
  }) {
    final $result = create();
    if (homePatternType != null) {
      $result.homePatternType = homePatternType;
    }
    if (pathPattern != null) {
      $result.pathPattern = pathPattern;
    }
    return $result;
  }
  HomePrompt_MoreOption._() : super();
  factory HomePrompt_MoreOption.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomePrompt_MoreOption.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomePrompt.MoreOption', package: const $pb.PackageName(_omitMessageNames ? '' : 'apparmor_prompting'), createEmptyInstance: create)
    ..e<HomePatternType>(1, _omitFieldNames ? '' : 'homePatternType', $pb.PbFieldType.OE, defaultOrMaker: HomePatternType.REQUESTED_DIRECTORY, valueOf: HomePatternType.valueOf, enumValues: HomePatternType.values)
    ..aOS(2, _omitFieldNames ? '' : 'pathPattern')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomePrompt_MoreOption clone() => HomePrompt_MoreOption()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomePrompt_MoreOption copyWith(void Function(HomePrompt_MoreOption) updates) => super.copyWith((message) => updates(message as HomePrompt_MoreOption)) as HomePrompt_MoreOption;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePrompt_MoreOption create() => HomePrompt_MoreOption._();
  HomePrompt_MoreOption createEmptyInstance() => create();
  static $pb.PbList<HomePrompt_MoreOption> createRepeated() => $pb.PbList<HomePrompt_MoreOption>();
  @$core.pragma('dart2js:noInline')
  static HomePrompt_MoreOption getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomePrompt_MoreOption>(create);
  static HomePrompt_MoreOption? _defaultInstance;

  @$pb.TagNumber(1)
  HomePatternType get homePatternType => $_getN(0);
  @$pb.TagNumber(1)
  set homePatternType(HomePatternType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHomePatternType() => $_has(0);
  @$pb.TagNumber(1)
  void clearHomePatternType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pathPattern => $_getSZ(1);
  @$pb.TagNumber(2)
  set pathPattern($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPathPattern() => $_has(1);
  @$pb.TagNumber(2)
  void clearPathPattern() => clearField(2);
}

class HomePrompt extends $pb.GeneratedMessage {
  factory HomePrompt({
    MetaData? metaData,
    $core.String? requestedPath,
    $core.Iterable<$core.String>? requestedPermissions,
    $core.Iterable<$core.String>? availablePermissions,
    $core.Iterable<HomePrompt_MoreOption>? moreOptions,
  }) {
    final $result = create();
    if (metaData != null) {
      $result.metaData = metaData;
    }
    if (requestedPath != null) {
      $result.requestedPath = requestedPath;
    }
    if (requestedPermissions != null) {
      $result.requestedPermissions.addAll(requestedPermissions);
    }
    if (availablePermissions != null) {
      $result.availablePermissions.addAll(availablePermissions);
    }
    if (moreOptions != null) {
      $result.moreOptions.addAll(moreOptions);
    }
    return $result;
  }
  HomePrompt._() : super();
  factory HomePrompt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomePrompt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HomePrompt', package: const $pb.PackageName(_omitMessageNames ? '' : 'apparmor_prompting'), createEmptyInstance: create)
    ..aOM<MetaData>(1, _omitFieldNames ? '' : 'metaData', subBuilder: MetaData.create)
    ..aOS(2, _omitFieldNames ? '' : 'requestedPath')
    ..pPS(3, _omitFieldNames ? '' : 'requestedPermissions')
    ..pPS(4, _omitFieldNames ? '' : 'availablePermissions')
    ..pc<HomePrompt_MoreOption>(5, _omitFieldNames ? '' : 'moreOptions', $pb.PbFieldType.PM, subBuilder: HomePrompt_MoreOption.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomePrompt clone() => HomePrompt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomePrompt copyWith(void Function(HomePrompt) updates) => super.copyWith((message) => updates(message as HomePrompt)) as HomePrompt;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePrompt create() => HomePrompt._();
  HomePrompt createEmptyInstance() => create();
  static $pb.PbList<HomePrompt> createRepeated() => $pb.PbList<HomePrompt>();
  @$core.pragma('dart2js:noInline')
  static HomePrompt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomePrompt>(create);
  static HomePrompt? _defaultInstance;

  @$pb.TagNumber(1)
  MetaData get metaData => $_getN(0);
  @$pb.TagNumber(1)
  set metaData(MetaData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetaData() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetaData() => clearField(1);
  @$pb.TagNumber(1)
  MetaData ensureMetaData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get requestedPath => $_getSZ(1);
  @$pb.TagNumber(2)
  set requestedPath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRequestedPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestedPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get requestedPermissions => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get availablePermissions => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<HomePrompt_MoreOption> get moreOptions => $_getList(4);
}

class MetaData extends $pb.GeneratedMessage {
  factory MetaData({
    $core.String? promptId,
    $core.String? snapName,
    $core.String? storeUrl,
    $core.String? publisher,
    $core.String? updatedAt,
  }) {
    final $result = create();
    if (promptId != null) {
      $result.promptId = promptId;
    }
    if (snapName != null) {
      $result.snapName = snapName;
    }
    if (storeUrl != null) {
      $result.storeUrl = storeUrl;
    }
    if (publisher != null) {
      $result.publisher = publisher;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  MetaData._() : super();
  factory MetaData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MetaData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetaData', package: const $pb.PackageName(_omitMessageNames ? '' : 'apparmor_prompting'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'promptId')
    ..aOS(2, _omitFieldNames ? '' : 'snapName')
    ..aOS(3, _omitFieldNames ? '' : 'storeUrl')
    ..aOS(4, _omitFieldNames ? '' : 'publisher')
    ..aOS(5, _omitFieldNames ? '' : 'updatedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MetaData clone() => MetaData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MetaData copyWith(void Function(MetaData) updates) => super.copyWith((message) => updates(message as MetaData)) as MetaData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetaData create() => MetaData._();
  MetaData createEmptyInstance() => create();
  static $pb.PbList<MetaData> createRepeated() => $pb.PbList<MetaData>();
  @$core.pragma('dart2js:noInline')
  static MetaData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetaData>(create);
  static MetaData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get promptId => $_getSZ(0);
  @$pb.TagNumber(1)
  set promptId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPromptId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPromptId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get snapName => $_getSZ(1);
  @$pb.TagNumber(2)
  set snapName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSnapName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSnapName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get storeUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStoreUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get publisher => $_getSZ(3);
  @$pb.TagNumber(4)
  set publisher($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPublisher() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublisher() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get updatedAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set updatedAt($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => clearField(5);
}

class ResolveHomePatternTypeResponse extends $pb.GeneratedMessage {
  factory ResolveHomePatternTypeResponse({
    HomePatternType? homePatternType,
  }) {
    final $result = create();
    if (homePatternType != null) {
      $result.homePatternType = homePatternType;
    }
    return $result;
  }
  ResolveHomePatternTypeResponse._() : super();
  factory ResolveHomePatternTypeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResolveHomePatternTypeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResolveHomePatternTypeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'apparmor_prompting'), createEmptyInstance: create)
    ..e<HomePatternType>(1, _omitFieldNames ? '' : 'homePatternType', $pb.PbFieldType.OE, defaultOrMaker: HomePatternType.REQUESTED_DIRECTORY, valueOf: HomePatternType.valueOf, enumValues: HomePatternType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResolveHomePatternTypeResponse clone() => ResolveHomePatternTypeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResolveHomePatternTypeResponse copyWith(void Function(ResolveHomePatternTypeResponse) updates) => super.copyWith((message) => updates(message as ResolveHomePatternTypeResponse)) as ResolveHomePatternTypeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolveHomePatternTypeResponse create() => ResolveHomePatternTypeResponse._();
  ResolveHomePatternTypeResponse createEmptyInstance() => create();
  static $pb.PbList<ResolveHomePatternTypeResponse> createRepeated() => $pb.PbList<ResolveHomePatternTypeResponse>();
  @$core.pragma('dart2js:noInline')
  static ResolveHomePatternTypeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResolveHomePatternTypeResponse>(create);
  static ResolveHomePatternTypeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  HomePatternType get homePatternType => $_getN(0);
  @$pb.TagNumber(1)
  set homePatternType(HomePatternType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHomePatternType() => $_has(0);
  @$pb.TagNumber(1)
  void clearHomePatternType() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
