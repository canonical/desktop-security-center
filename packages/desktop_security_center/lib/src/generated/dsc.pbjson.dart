//
//  Generated code. Do not modify.
//  source: dsc.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use isSecureBootEnabledResponseDescriptor instead')
const IsSecureBootEnabledResponse$json = {
  '1': 'IsSecureBootEnabledResponse',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `IsSecureBootEnabledResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isSecureBootEnabledResponseDescriptor = $convert.base64Decode(
    'ChtJc1NlY3VyZUJvb3RFbmFibGVkUmVzcG9uc2USGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZA'
    '==');

@$core.Deprecated('Use attachRequestDescriptor instead')
const AttachRequest$json = {
  '1': 'AttachRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `AttachRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attachRequestDescriptor = $convert.base64Decode(
    'Cg1BdHRhY2hSZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbg==');

@$core.Deprecated('Use initiateResponseDescriptor instead')
const InitiateResponse$json = {
  '1': 'InitiateResponse',
  '2': [
    {'1': 'pin', '3': 1, '4': 1, '5': 9, '10': 'pin'},
    {'1': 'expiresIn', '3': 2, '4': 1, '5': 3, '10': 'expiresIn'},
  ],
};

/// Descriptor for `InitiateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateResponseDescriptor = $convert.base64Decode(
    'ChBJbml0aWF0ZVJlc3BvbnNlEhAKA3BpbhgBIAEoCVIDcGluEhwKCWV4cGlyZXNJbhgCIAEoA1'
    'IJZXhwaXJlc0lu');

@$core.Deprecated('Use waitResponseDescriptor instead')
const WaitResponse$json = {
  '1': 'WaitResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `WaitResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List waitResponseDescriptor = $convert.base64Decode(
    'CgxXYWl0UmVzcG9uc2USFAoFdG9rZW4YASABKAlSBXRva2Vu');

