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

class Action extends $pb.ProtobufEnum {
  static const Action ALLOW = Action._(0, _omitEnumNames ? '' : 'ALLOW');
  static const Action DENY = Action._(1, _omitEnumNames ? '' : 'DENY');

  static const $core.List<Action> values = <Action> [
    ALLOW,
    DENY,
  ];

  static final $core.Map<$core.int, Action> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Action? valueOf($core.int value) => _byValue[value];

  const Action._($core.int v, $core.String n) : super(v, n);
}

class Lifespan extends $pb.ProtobufEnum {
  static const Lifespan SINGLE = Lifespan._(0, _omitEnumNames ? '' : 'SINGLE');
  static const Lifespan SESSION = Lifespan._(1, _omitEnumNames ? '' : 'SESSION');
  static const Lifespan FOREVER = Lifespan._(2, _omitEnumNames ? '' : 'FOREVER');

  static const $core.List<Lifespan> values = <Lifespan> [
    SINGLE,
    SESSION,
    FOREVER,
  ];

  static final $core.Map<$core.int, Lifespan> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Lifespan? valueOf($core.int value) => _byValue[value];

  const Lifespan._($core.int v, $core.String n) : super(v, n);
}

class HomePatternType extends $pb.ProtobufEnum {
  static const HomePatternType REQUESTED_DIRECTORY = HomePatternType._(0, _omitEnumNames ? '' : 'REQUESTED_DIRECTORY');
  static const HomePatternType REQUESTED_FILE = HomePatternType._(1, _omitEnumNames ? '' : 'REQUESTED_FILE');
  static const HomePatternType TOP_LEVEL_DIRECTORY = HomePatternType._(2, _omitEnumNames ? '' : 'TOP_LEVEL_DIRECTORY');
  static const HomePatternType HOME_DIRECTORY = HomePatternType._(3, _omitEnumNames ? '' : 'HOME_DIRECTORY');
  static const HomePatternType MATCHING_FILE_EXTENSION = HomePatternType._(4, _omitEnumNames ? '' : 'MATCHING_FILE_EXTENSION');
  static const HomePatternType ARCHIVE_FILES = HomePatternType._(5, _omitEnumNames ? '' : 'ARCHIVE_FILES');
  static const HomePatternType AUDIO_FILES = HomePatternType._(6, _omitEnumNames ? '' : 'AUDIO_FILES');
  static const HomePatternType DOCUMENT_FILES = HomePatternType._(7, _omitEnumNames ? '' : 'DOCUMENT_FILES');
  static const HomePatternType IMAGE_FILES = HomePatternType._(8, _omitEnumNames ? '' : 'IMAGE_FILES');
  static const HomePatternType VIDEO_FILES = HomePatternType._(9, _omitEnumNames ? '' : 'VIDEO_FILES');

  static const $core.List<HomePatternType> values = <HomePatternType> [
    REQUESTED_DIRECTORY,
    REQUESTED_FILE,
    TOP_LEVEL_DIRECTORY,
    HOME_DIRECTORY,
    MATCHING_FILE_EXTENSION,
    ARCHIVE_FILES,
    AUDIO_FILES,
    DOCUMENT_FILES,
    IMAGE_FILES,
    VIDEO_FILES,
  ];

  static final $core.Map<$core.int, HomePatternType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HomePatternType? valueOf($core.int value) => _byValue[value];

  const HomePatternType._($core.int v, $core.String n) : super(v, n);
}

class PromptReplyResponse_PromptReplyType extends $pb.ProtobufEnum {
  static const PromptReplyResponse_PromptReplyType SUCCESS = PromptReplyResponse_PromptReplyType._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const PromptReplyResponse_PromptReplyType UNKNOWN = PromptReplyResponse_PromptReplyType._(1, _omitEnumNames ? '' : 'UNKNOWN');

  static const $core.List<PromptReplyResponse_PromptReplyType> values = <PromptReplyResponse_PromptReplyType> [
    SUCCESS,
    UNKNOWN,
  ];

  static final $core.Map<$core.int, PromptReplyResponse_PromptReplyType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PromptReplyResponse_PromptReplyType? valueOf($core.int value) => _byValue[value];

  const PromptReplyResponse_PromptReplyType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
