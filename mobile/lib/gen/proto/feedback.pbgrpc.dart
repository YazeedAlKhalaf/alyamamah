//
//  Generated code. Do not modify.
//  source: proto/feedback.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'feedback.pb.dart' as $1;

export 'feedback.pb.dart';

@$pb.GrpcServiceName('Feedback')
class FeedbackClient extends $grpc.Client {
  static final _$getFeedbackCategories = $grpc.ClientMethod<$1.GetFeedbackCategoriesRequest, $1.GetFeedbackCategoriesResponse>(
      '/Feedback/GetFeedbackCategories',
      ($1.GetFeedbackCategoriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetFeedbackCategoriesResponse.fromBuffer(value));
  static final _$createFeedback = $grpc.ClientMethod<$1.CreateFeedbackRequest, $1.CreateFeedbackResponse>(
      '/Feedback/CreateFeedback',
      ($1.CreateFeedbackRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CreateFeedbackResponse.fromBuffer(value));
  static final _$getFeedback = $grpc.ClientMethod<$1.GetFeedbackRequest, $1.GetFeedbackResponse>(
      '/Feedback/GetFeedback',
      ($1.GetFeedbackRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetFeedbackResponse.fromBuffer(value));

  FeedbackClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetFeedbackCategoriesResponse> getFeedbackCategories($1.GetFeedbackCategoriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFeedbackCategories, request, options: options);
  }

  $grpc.ResponseFuture<$1.CreateFeedbackResponse> createFeedback($1.CreateFeedbackRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFeedback, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetFeedbackResponse> getFeedback($1.GetFeedbackRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFeedback, request, options: options);
  }
}

@$pb.GrpcServiceName('Feedback')
abstract class FeedbackServiceBase extends $grpc.Service {
  $core.String get $name => 'Feedback';

  FeedbackServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.GetFeedbackCategoriesRequest, $1.GetFeedbackCategoriesResponse>(
        'GetFeedbackCategories',
        getFeedbackCategories_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetFeedbackCategoriesRequest.fromBuffer(value),
        ($1.GetFeedbackCategoriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateFeedbackRequest, $1.CreateFeedbackResponse>(
        'CreateFeedback',
        createFeedback_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateFeedbackRequest.fromBuffer(value),
        ($1.CreateFeedbackResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetFeedbackRequest, $1.GetFeedbackResponse>(
        'GetFeedback',
        getFeedback_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetFeedbackRequest.fromBuffer(value),
        ($1.GetFeedbackResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetFeedbackCategoriesResponse> getFeedbackCategories_Pre($grpc.ServiceCall call, $async.Future<$1.GetFeedbackCategoriesRequest> request) async {
    return getFeedbackCategories(call, await request);
  }

  $async.Future<$1.CreateFeedbackResponse> createFeedback_Pre($grpc.ServiceCall call, $async.Future<$1.CreateFeedbackRequest> request) async {
    return createFeedback(call, await request);
  }

  $async.Future<$1.GetFeedbackResponse> getFeedback_Pre($grpc.ServiceCall call, $async.Future<$1.GetFeedbackRequest> request) async {
    return getFeedback(call, await request);
  }

  $async.Future<$1.GetFeedbackCategoriesResponse> getFeedbackCategories($grpc.ServiceCall call, $1.GetFeedbackCategoriesRequest request);
  $async.Future<$1.CreateFeedbackResponse> createFeedback($grpc.ServiceCall call, $1.CreateFeedbackRequest request);
  $async.Future<$1.GetFeedbackResponse> getFeedback($grpc.ServiceCall call, $1.GetFeedbackRequest request);
}
