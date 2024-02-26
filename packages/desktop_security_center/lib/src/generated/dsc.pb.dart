//
//  Generated code. Do not modify.
//  source: dsc.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class IsSecureBootEnabledResponse extends $pb.GeneratedMessage {
  factory IsSecureBootEnabledResponse({
    $core.bool? enabled,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    return $result;
  }
  IsSecureBootEnabledResponse._() : super();
  factory IsSecureBootEnabledResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsSecureBootEnabledResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IsSecureBootEnabledResponse', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsSecureBootEnabledResponse clone() => IsSecureBootEnabledResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsSecureBootEnabledResponse copyWith(void Function(IsSecureBootEnabledResponse) updates) => super.copyWith((message) => updates(message as IsSecureBootEnabledResponse)) as IsSecureBootEnabledResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsSecureBootEnabledResponse create() => IsSecureBootEnabledResponse._();
  IsSecureBootEnabledResponse createEmptyInstance() => create();
  static $pb.PbList<IsSecureBootEnabledResponse> createRepeated() => $pb.PbList<IsSecureBootEnabledResponse>();
  @$core.pragma('dart2js:noInline')
  static IsSecureBootEnabledResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsSecureBootEnabledResponse>(create);
  static IsSecureBootEnabledResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);
}

class AttachRequest extends $pb.GeneratedMessage {
  factory AttachRequest({
    $core.String? token,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  AttachRequest._() : super();
  factory AttachRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttachRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AttachRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttachRequest clone() => AttachRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttachRequest copyWith(void Function(AttachRequest) updates) => super.copyWith((message) => updates(message as AttachRequest)) as AttachRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttachRequest create() => AttachRequest._();
  AttachRequest createEmptyInstance() => create();
  static $pb.PbList<AttachRequest> createRepeated() => $pb.PbList<AttachRequest>();
  @$core.pragma('dart2js:noInline')
  static AttachRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttachRequest>(create);
  static AttachRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}

class InitiateResponse extends $pb.GeneratedMessage {
  factory InitiateResponse({
    $core.String? pin,
    $fixnum.Int64? expiresIn,
  }) {
    final $result = create();
    if (pin != null) {
      $result.pin = pin;
    }
    if (expiresIn != null) {
      $result.expiresIn = expiresIn;
    }
    return $result;
  }
  InitiateResponse._() : super();
  factory InitiateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitiateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InitiateResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pin')
    ..aInt64(2, _omitFieldNames ? '' : 'expiresIn', protoName: 'expiresIn')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitiateResponse clone() => InitiateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitiateResponse copyWith(void Function(InitiateResponse) updates) => super.copyWith((message) => updates(message as InitiateResponse)) as InitiateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateResponse create() => InitiateResponse._();
  InitiateResponse createEmptyInstance() => create();
  static $pb.PbList<InitiateResponse> createRepeated() => $pb.PbList<InitiateResponse>();
  @$core.pragma('dart2js:noInline')
  static InitiateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitiateResponse>(create);
  static InitiateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pin => $_getSZ(0);
  @$pb.TagNumber(1)
  set pin($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPin() => $_has(0);
  @$pb.TagNumber(1)
  void clearPin() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get expiresIn => $_getI64(1);
  @$pb.TagNumber(2)
  set expiresIn($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiresIn() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresIn() => clearField(2);
}

class WaitResponse extends $pb.GeneratedMessage {
  factory WaitResponse({
    $core.String? token,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  WaitResponse._() : super();
  factory WaitResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WaitResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WaitResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WaitResponse clone() => WaitResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WaitResponse copyWith(void Function(WaitResponse) updates) => super.copyWith((message) => updates(message as WaitResponse)) as WaitResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WaitResponse create() => WaitResponse._();
  WaitResponse createEmptyInstance() => create();
  static $pb.PbList<WaitResponse> createRepeated() => $pb.PbList<WaitResponse>();
  @$core.pragma('dart2js:noInline')
  static WaitResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WaitResponse>(create);
  static WaitResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
