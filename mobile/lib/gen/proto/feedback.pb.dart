//
//  Generated code. Do not modify.
//  source: proto/feedback.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetFeedbackCategoriesRequest extends $pb.GeneratedMessage {
  factory GetFeedbackCategoriesRequest() => create();
  GetFeedbackCategoriesRequest._() : super();
  factory GetFeedbackCategoriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFeedbackCategoriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFeedbackCategoriesRequest', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFeedbackCategoriesRequest clone() => GetFeedbackCategoriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFeedbackCategoriesRequest copyWith(void Function(GetFeedbackCategoriesRequest) updates) => super.copyWith((message) => updates(message as GetFeedbackCategoriesRequest)) as GetFeedbackCategoriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFeedbackCategoriesRequest create() => GetFeedbackCategoriesRequest._();
  GetFeedbackCategoriesRequest createEmptyInstance() => create();
  static $pb.PbList<GetFeedbackCategoriesRequest> createRepeated() => $pb.PbList<GetFeedbackCategoriesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFeedbackCategoriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFeedbackCategoriesRequest>(create);
  static GetFeedbackCategoriesRequest? _defaultInstance;
}

class FeedbackCategory extends $pb.GeneratedMessage {
  factory FeedbackCategory({
    $core.String? id,
    $core.String? nameAr,
    $core.String? nameEn,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (nameAr != null) {
      $result.nameAr = nameAr;
    }
    if (nameEn != null) {
      $result.nameEn = nameEn;
    }
    return $result;
  }
  FeedbackCategory._() : super();
  factory FeedbackCategory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeedbackCategory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FeedbackCategory', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nameAr')
    ..aOS(3, _omitFieldNames ? '' : 'nameEn')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeedbackCategory clone() => FeedbackCategory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeedbackCategory copyWith(void Function(FeedbackCategory) updates) => super.copyWith((message) => updates(message as FeedbackCategory)) as FeedbackCategory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeedbackCategory create() => FeedbackCategory._();
  FeedbackCategory createEmptyInstance() => create();
  static $pb.PbList<FeedbackCategory> createRepeated() => $pb.PbList<FeedbackCategory>();
  @$core.pragma('dart2js:noInline')
  static FeedbackCategory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedbackCategory>(create);
  static FeedbackCategory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nameAr => $_getSZ(1);
  @$pb.TagNumber(2)
  set nameAr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNameAr() => $_has(1);
  @$pb.TagNumber(2)
  void clearNameAr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameEn() => clearField(3);
}

class GetFeedbackCategoriesResponse extends $pb.GeneratedMessage {
  factory GetFeedbackCategoriesResponse({
    $core.Iterable<FeedbackCategory>? categories,
  }) {
    final $result = create();
    if (categories != null) {
      $result.categories.addAll(categories);
    }
    return $result;
  }
  GetFeedbackCategoriesResponse._() : super();
  factory GetFeedbackCategoriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFeedbackCategoriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFeedbackCategoriesResponse', createEmptyInstance: create)
    ..pc<FeedbackCategory>(1, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM, subBuilder: FeedbackCategory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFeedbackCategoriesResponse clone() => GetFeedbackCategoriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFeedbackCategoriesResponse copyWith(void Function(GetFeedbackCategoriesResponse) updates) => super.copyWith((message) => updates(message as GetFeedbackCategoriesResponse)) as GetFeedbackCategoriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFeedbackCategoriesResponse create() => GetFeedbackCategoriesResponse._();
  GetFeedbackCategoriesResponse createEmptyInstance() => create();
  static $pb.PbList<GetFeedbackCategoriesResponse> createRepeated() => $pb.PbList<GetFeedbackCategoriesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFeedbackCategoriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFeedbackCategoriesResponse>(create);
  static GetFeedbackCategoriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FeedbackCategory> get categories => $_getList(0);
}

class CreateFeedbackRequest extends $pb.GeneratedMessage {
  factory CreateFeedbackRequest({
    $core.String? title,
    $core.String? body,
    $core.String? categoryId,
    $core.String? studentId,
    $core.String? studentName,
    $core.String? studentEmail,
    $core.String? studentPhone,
    $core.String? studentMajor,
    $core.String? studentJoinSemester,
    $core.String? studentCurrentSemester,
    $core.String? studentGender,
    $core.int? studentRemainingHours,
    $core.int? studentTakenHours,
    $core.int? studentTotalHours,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (body != null) {
      $result.body = body;
    }
    if (categoryId != null) {
      $result.categoryId = categoryId;
    }
    if (studentId != null) {
      $result.studentId = studentId;
    }
    if (studentName != null) {
      $result.studentName = studentName;
    }
    if (studentEmail != null) {
      $result.studentEmail = studentEmail;
    }
    if (studentPhone != null) {
      $result.studentPhone = studentPhone;
    }
    if (studentMajor != null) {
      $result.studentMajor = studentMajor;
    }
    if (studentJoinSemester != null) {
      $result.studentJoinSemester = studentJoinSemester;
    }
    if (studentCurrentSemester != null) {
      $result.studentCurrentSemester = studentCurrentSemester;
    }
    if (studentGender != null) {
      $result.studentGender = studentGender;
    }
    if (studentRemainingHours != null) {
      $result.studentRemainingHours = studentRemainingHours;
    }
    if (studentTakenHours != null) {
      $result.studentTakenHours = studentTakenHours;
    }
    if (studentTotalHours != null) {
      $result.studentTotalHours = studentTotalHours;
    }
    return $result;
  }
  CreateFeedbackRequest._() : super();
  factory CreateFeedbackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFeedbackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFeedbackRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'body')
    ..aOS(3, _omitFieldNames ? '' : 'categoryId')
    ..aOS(4, _omitFieldNames ? '' : 'studentId')
    ..aOS(5, _omitFieldNames ? '' : 'studentName')
    ..aOS(6, _omitFieldNames ? '' : 'studentEmail')
    ..aOS(7, _omitFieldNames ? '' : 'studentPhone')
    ..aOS(8, _omitFieldNames ? '' : 'studentMajor')
    ..aOS(9, _omitFieldNames ? '' : 'studentJoinSemester')
    ..aOS(10, _omitFieldNames ? '' : 'studentCurrentSemester')
    ..aOS(11, _omitFieldNames ? '' : 'studentGender')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'studentRemainingHours', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'studentTakenHours', $pb.PbFieldType.O3)
    ..a<$core.int>(14, _omitFieldNames ? '' : 'studentTotalHours', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFeedbackRequest clone() => CreateFeedbackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFeedbackRequest copyWith(void Function(CreateFeedbackRequest) updates) => super.copyWith((message) => updates(message as CreateFeedbackRequest)) as CreateFeedbackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFeedbackRequest create() => CreateFeedbackRequest._();
  CreateFeedbackRequest createEmptyInstance() => create();
  static $pb.PbList<CreateFeedbackRequest> createRepeated() => $pb.PbList<CreateFeedbackRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFeedbackRequest>(create);
  static CreateFeedbackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get body => $_getSZ(1);
  @$pb.TagNumber(2)
  set body($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get categoryId => $_getSZ(2);
  @$pb.TagNumber(3)
  set categoryId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCategoryId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategoryId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get studentId => $_getSZ(3);
  @$pb.TagNumber(4)
  set studentId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStudentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStudentId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get studentName => $_getSZ(4);
  @$pb.TagNumber(5)
  set studentName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStudentName() => $_has(4);
  @$pb.TagNumber(5)
  void clearStudentName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get studentEmail => $_getSZ(5);
  @$pb.TagNumber(6)
  set studentEmail($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStudentEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearStudentEmail() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get studentPhone => $_getSZ(6);
  @$pb.TagNumber(7)
  set studentPhone($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStudentPhone() => $_has(6);
  @$pb.TagNumber(7)
  void clearStudentPhone() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get studentMajor => $_getSZ(7);
  @$pb.TagNumber(8)
  set studentMajor($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStudentMajor() => $_has(7);
  @$pb.TagNumber(8)
  void clearStudentMajor() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get studentJoinSemester => $_getSZ(8);
  @$pb.TagNumber(9)
  set studentJoinSemester($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStudentJoinSemester() => $_has(8);
  @$pb.TagNumber(9)
  void clearStudentJoinSemester() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get studentCurrentSemester => $_getSZ(9);
  @$pb.TagNumber(10)
  set studentCurrentSemester($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasStudentCurrentSemester() => $_has(9);
  @$pb.TagNumber(10)
  void clearStudentCurrentSemester() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get studentGender => $_getSZ(10);
  @$pb.TagNumber(11)
  set studentGender($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasStudentGender() => $_has(10);
  @$pb.TagNumber(11)
  void clearStudentGender() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get studentRemainingHours => $_getIZ(11);
  @$pb.TagNumber(12)
  set studentRemainingHours($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasStudentRemainingHours() => $_has(11);
  @$pb.TagNumber(12)
  void clearStudentRemainingHours() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get studentTakenHours => $_getIZ(12);
  @$pb.TagNumber(13)
  set studentTakenHours($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasStudentTakenHours() => $_has(12);
  @$pb.TagNumber(13)
  void clearStudentTakenHours() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get studentTotalHours => $_getIZ(13);
  @$pb.TagNumber(14)
  set studentTotalHours($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasStudentTotalHours() => $_has(13);
  @$pb.TagNumber(14)
  void clearStudentTotalHours() => clearField(14);
}

class CreateFeedbackResponse extends $pb.GeneratedMessage {
  factory CreateFeedbackResponse() => create();
  CreateFeedbackResponse._() : super();
  factory CreateFeedbackResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFeedbackResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFeedbackResponse', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFeedbackResponse clone() => CreateFeedbackResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFeedbackResponse copyWith(void Function(CreateFeedbackResponse) updates) => super.copyWith((message) => updates(message as CreateFeedbackResponse)) as CreateFeedbackResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFeedbackResponse create() => CreateFeedbackResponse._();
  CreateFeedbackResponse createEmptyInstance() => create();
  static $pb.PbList<CreateFeedbackResponse> createRepeated() => $pb.PbList<CreateFeedbackResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFeedbackResponse>(create);
  static CreateFeedbackResponse? _defaultInstance;
}

class FeedbackItem extends $pb.GeneratedMessage {
  factory FeedbackItem({
    $core.String? id,
    $core.String? title,
    $core.String? body,
    FeedbackCategory? category,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (body != null) {
      $result.body = body;
    }
    if (category != null) {
      $result.category = category;
    }
    return $result;
  }
  FeedbackItem._() : super();
  factory FeedbackItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeedbackItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FeedbackItem', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'body')
    ..aOM<FeedbackCategory>(4, _omitFieldNames ? '' : 'category', subBuilder: FeedbackCategory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeedbackItem clone() => FeedbackItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeedbackItem copyWith(void Function(FeedbackItem) updates) => super.copyWith((message) => updates(message as FeedbackItem)) as FeedbackItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeedbackItem create() => FeedbackItem._();
  FeedbackItem createEmptyInstance() => create();
  static $pb.PbList<FeedbackItem> createRepeated() => $pb.PbList<FeedbackItem>();
  @$core.pragma('dart2js:noInline')
  static FeedbackItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedbackItem>(create);
  static FeedbackItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => clearField(3);

  @$pb.TagNumber(4)
  FeedbackCategory get category => $_getN(3);
  @$pb.TagNumber(4)
  set category(FeedbackCategory v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => clearField(4);
  @$pb.TagNumber(4)
  FeedbackCategory ensureCategory() => $_ensure(3);
}

class GetFeedbackRequest extends $pb.GeneratedMessage {
  factory GetFeedbackRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetFeedbackRequest._() : super();
  factory GetFeedbackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFeedbackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFeedbackRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFeedbackRequest clone() => GetFeedbackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFeedbackRequest copyWith(void Function(GetFeedbackRequest) updates) => super.copyWith((message) => updates(message as GetFeedbackRequest)) as GetFeedbackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFeedbackRequest create() => GetFeedbackRequest._();
  GetFeedbackRequest createEmptyInstance() => create();
  static $pb.PbList<GetFeedbackRequest> createRepeated() => $pb.PbList<GetFeedbackRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFeedbackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFeedbackRequest>(create);
  static GetFeedbackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetFeedbackResponse extends $pb.GeneratedMessage {
  factory GetFeedbackResponse({
    $core.Iterable<FeedbackItem>? feedbackItems,
  }) {
    final $result = create();
    if (feedbackItems != null) {
      $result.feedbackItems.addAll(feedbackItems);
    }
    return $result;
  }
  GetFeedbackResponse._() : super();
  factory GetFeedbackResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFeedbackResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFeedbackResponse', createEmptyInstance: create)
    ..pc<FeedbackItem>(1, _omitFieldNames ? '' : 'feedbackItems', $pb.PbFieldType.PM, subBuilder: FeedbackItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFeedbackResponse clone() => GetFeedbackResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFeedbackResponse copyWith(void Function(GetFeedbackResponse) updates) => super.copyWith((message) => updates(message as GetFeedbackResponse)) as GetFeedbackResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFeedbackResponse create() => GetFeedbackResponse._();
  GetFeedbackResponse createEmptyInstance() => create();
  static $pb.PbList<GetFeedbackResponse> createRepeated() => $pb.PbList<GetFeedbackResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFeedbackResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFeedbackResponse>(create);
  static GetFeedbackResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FeedbackItem> get feedbackItems => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
