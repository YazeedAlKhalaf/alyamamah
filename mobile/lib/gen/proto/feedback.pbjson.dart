//
//  Generated code. Do not modify.
//  source: proto/feedback.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getFeedbackCategoriesRequestDescriptor instead')
const GetFeedbackCategoriesRequest$json = {
  '1': 'GetFeedbackCategoriesRequest',
};

/// Descriptor for `GetFeedbackCategoriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFeedbackCategoriesRequestDescriptor = $convert.base64Decode(
    'ChxHZXRGZWVkYmFja0NhdGVnb3JpZXNSZXF1ZXN0');

@$core.Deprecated('Use feedbackCategoryDescriptor instead')
const FeedbackCategory$json = {
  '1': 'FeedbackCategory',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name_ar', '3': 2, '4': 1, '5': 9, '10': 'nameAr'},
    {'1': 'name_en', '3': 3, '4': 1, '5': 9, '10': 'nameEn'},
  ],
};

/// Descriptor for `FeedbackCategory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedbackCategoryDescriptor = $convert.base64Decode(
    'ChBGZWVkYmFja0NhdGVnb3J5Eg4KAmlkGAEgASgJUgJpZBIXCgduYW1lX2FyGAIgASgJUgZuYW'
    '1lQXISFwoHbmFtZV9lbhgDIAEoCVIGbmFtZUVu');

@$core.Deprecated('Use getFeedbackCategoriesResponseDescriptor instead')
const GetFeedbackCategoriesResponse$json = {
  '1': 'GetFeedbackCategoriesResponse',
  '2': [
    {'1': 'categories', '3': 1, '4': 3, '5': 11, '6': '.FeedbackCategory', '10': 'categories'},
  ],
};

/// Descriptor for `GetFeedbackCategoriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFeedbackCategoriesResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRGZWVkYmFja0NhdGVnb3JpZXNSZXNwb25zZRIxCgpjYXRlZ29yaWVzGAEgAygLMhEuRm'
    'VlZGJhY2tDYXRlZ29yeVIKY2F0ZWdvcmllcw==');

@$core.Deprecated('Use createFeedbackRequestDescriptor instead')
const CreateFeedbackRequest$json = {
  '1': 'CreateFeedbackRequest',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'body', '3': 2, '4': 1, '5': 9, '10': 'body'},
    {'1': 'category_id', '3': 3, '4': 1, '5': 9, '10': 'categoryId'},
    {'1': 'student_id', '3': 4, '4': 1, '5': 9, '10': 'studentId'},
    {'1': 'student_name', '3': 5, '4': 1, '5': 9, '10': 'studentName'},
    {'1': 'student_email', '3': 6, '4': 1, '5': 9, '10': 'studentEmail'},
    {'1': 'student_phone', '3': 7, '4': 1, '5': 9, '10': 'studentPhone'},
    {'1': 'student_major', '3': 8, '4': 1, '5': 9, '10': 'studentMajor'},
    {'1': 'student_join_semester', '3': 9, '4': 1, '5': 9, '10': 'studentJoinSemester'},
    {'1': 'student_current_semester', '3': 10, '4': 1, '5': 9, '10': 'studentCurrentSemester'},
    {'1': 'student_gender', '3': 11, '4': 1, '5': 9, '10': 'studentGender'},
    {'1': 'student_remaining_hours', '3': 12, '4': 1, '5': 5, '10': 'studentRemainingHours'},
    {'1': 'student_taken_hours', '3': 13, '4': 1, '5': 5, '10': 'studentTakenHours'},
    {'1': 'student_total_hours', '3': 14, '4': 1, '5': 5, '10': 'studentTotalHours'},
  ],
};

/// Descriptor for `CreateFeedbackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFeedbackRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVGZWVkYmFja1JlcXVlc3QSFAoFdGl0bGUYASABKAlSBXRpdGxlEhIKBGJvZHkYAi'
    'ABKAlSBGJvZHkSHwoLY2F0ZWdvcnlfaWQYAyABKAlSCmNhdGVnb3J5SWQSHQoKc3R1ZGVudF9p'
    'ZBgEIAEoCVIJc3R1ZGVudElkEiEKDHN0dWRlbnRfbmFtZRgFIAEoCVILc3R1ZGVudE5hbWUSIw'
    'oNc3R1ZGVudF9lbWFpbBgGIAEoCVIMc3R1ZGVudEVtYWlsEiMKDXN0dWRlbnRfcGhvbmUYByAB'
    'KAlSDHN0dWRlbnRQaG9uZRIjCg1zdHVkZW50X21ham9yGAggASgJUgxzdHVkZW50TWFqb3ISMg'
    'oVc3R1ZGVudF9qb2luX3NlbWVzdGVyGAkgASgJUhNzdHVkZW50Sm9pblNlbWVzdGVyEjgKGHN0'
    'dWRlbnRfY3VycmVudF9zZW1lc3RlchgKIAEoCVIWc3R1ZGVudEN1cnJlbnRTZW1lc3RlchIlCg'
    '5zdHVkZW50X2dlbmRlchgLIAEoCVINc3R1ZGVudEdlbmRlchI2ChdzdHVkZW50X3JlbWFpbmlu'
    'Z19ob3VycxgMIAEoBVIVc3R1ZGVudFJlbWFpbmluZ0hvdXJzEi4KE3N0dWRlbnRfdGFrZW5faG'
    '91cnMYDSABKAVSEXN0dWRlbnRUYWtlbkhvdXJzEi4KE3N0dWRlbnRfdG90YWxfaG91cnMYDiAB'
    'KAVSEXN0dWRlbnRUb3RhbEhvdXJz');

@$core.Deprecated('Use createFeedbackResponseDescriptor instead')
const CreateFeedbackResponse$json = {
  '1': 'CreateFeedbackResponse',
};

/// Descriptor for `CreateFeedbackResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFeedbackResponseDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVGZWVkYmFja1Jlc3BvbnNl');

@$core.Deprecated('Use feedbackItemDescriptor instead')
const FeedbackItem$json = {
  '1': 'FeedbackItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
    {'1': 'category', '3': 4, '4': 1, '5': 11, '6': '.FeedbackCategory', '10': 'category'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `FeedbackItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedbackItemDescriptor = $convert.base64Decode(
    'CgxGZWVkYmFja0l0ZW0SDgoCaWQYASABKAlSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRISCg'
    'Rib2R5GAMgASgJUgRib2R5Ei0KCGNhdGVnb3J5GAQgASgLMhEuRmVlZGJhY2tDYXRlZ29yeVII'
    'Y2F0ZWdvcnkSOQoKY3JlYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbX'
    'BSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use getFeedbackRequestDescriptor instead')
const GetFeedbackRequest$json = {
  '1': 'GetFeedbackRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
  ],
  '8': [
    {'1': '_id'},
  ],
};

/// Descriptor for `GetFeedbackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFeedbackRequestDescriptor = $convert.base64Decode(
    'ChJHZXRGZWVkYmFja1JlcXVlc3QSEwoCaWQYASABKAlIAFICaWSIAQFCBQoDX2lk');

@$core.Deprecated('Use getFeedbackResponseDescriptor instead')
const GetFeedbackResponse$json = {
  '1': 'GetFeedbackResponse',
  '2': [
    {'1': 'feedback_items', '3': 1, '4': 3, '5': 11, '6': '.FeedbackItem', '10': 'feedbackItems'},
  ],
};

/// Descriptor for `GetFeedbackResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFeedbackResponseDescriptor = $convert.base64Decode(
    'ChNHZXRGZWVkYmFja1Jlc3BvbnNlEjQKDmZlZWRiYWNrX2l0ZW1zGAEgAygLMg0uRmVlZGJhY2'
    'tJdGVtUg1mZWVkYmFja0l0ZW1z');

