import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/gen/proto/feedback.pbgrpc.dart';
import 'package:alyamamah/ui/views/feedback/feedback_state.dart';
import 'package:alyamamah/ui/views/feedback/feedback_view_model.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_body.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_category_formz.dart';
import 'package:alyamamah/ui/views/feedback/models/feedback_title.dart';
import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:alyamamah/ui/widgets/conditional_widget.dart';
import 'package:alyamamah/ui/widgets/shimmer_loading.dart';
import 'package:alyamamah/ui/widgets/yu_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FeedbackView extends ConsumerStatefulWidget {
  const FeedbackView({super.key});

  @override
  ConsumerState<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends ConsumerState<FeedbackView> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await ref
          .read(feedbackViewModelProvider.notifier)
          .getFeedbackCategories();
    });
  }

  List<DropdownMenuItem<FeedbackCategory>> getFeedbackCategoryItems({
    required List<FeedbackCategory> feedbackCategories,
    required Locale locale,
  }) {
    return feedbackCategories.map(
      (feedbackCategory) {
        final text = locale.languageCode == 'ar'
            ? feedbackCategory.nameAr
            : feedbackCategory.nameEn;
        return DropdownMenuItem(
          value: feedbackCategory,
          child: Text(text),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(feedbackViewModelProvider, (previous, next) {
      if (previous == next) return;

      switch (next.status) {
        case FeedbackStatus.errorSendingFeedback:
          YUSnackBar.show(
            context,
            message: context.s.failed_to_send_feedback,
          );
          break;
        case FeedbackStatus.sentFeedback:
          YUSnackBar.show(
            context,
            message: context.s.feedback_sent_successfully,
          );
          context.popRoute();
          break;
        default:
      }
    });

    final feedbackState = ref.watch(feedbackViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.feedback_for_student_council),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Constants.padding),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: context.s.title,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Constants.padding,
                            ),
                          ),
                          errorText: mapFeedbackTitleValidationErrorToText(
                            context: context,
                            error: feedbackState.title.displayError,
                          ),
                        ),
                        maxLength: 100,
                        onChanged: ref
                            .read(feedbackViewModelProvider.notifier)
                            .onTitleChanged,
                      ),
                      const SizedBox(height: Constants.padding),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: ConditionalWidget(
                          condition: feedbackState.status ==
                              FeedbackStatus.errorLoadingCategories,
                          showTrue: Text(
                            context.s.failed_to_load_feedback_categories,
                          ),
                          showFalse: ShimmerLoading(
                            isLoading: feedbackState.status ==
                                FeedbackStatus.loadingCategories,
                            child: DropdownButtonFormField<FeedbackCategory>(
                              items: getFeedbackCategoryItems(
                                feedbackCategories: feedbackState.categories,
                                locale: Localizations.localeOf(context),
                              ),
                              onChanged: ref
                                  .read(feedbackViewModelProvider.notifier)
                                  .onCategoryChanged,
                              decoration: InputDecoration(
                                labelText: context.s.category,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Constants.padding,
                                  ),
                                ),
                                errorText:
                                    mapFeedbackCategoryValidationErrorToText(
                                  context: context,
                                  error: feedbackState.category.displayError,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Constants.padding),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: context.s.body,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Constants.padding,
                            ),
                          ),
                          errorText: mapFeedbackBodyValidationErrorToText(
                            context: context,
                            error: feedbackState.body.displayError,
                          ),
                        ),
                        maxLength: 1000,
                        minLines: 2,
                        maxLines: 5,
                        onChanged: ref
                            .read(feedbackViewModelProvider.notifier)
                            .onBodyChanged,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Constants.padding / 2),
                CheckboxListTile(
                  value: feedbackState.shareMyContactInformation,
                  title: Text(context.s.share_my_contact_information),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: ref
                      .read(feedbackViewModelProvider.notifier)
                      .onShareMyContactInformationChanged,
                ),
                const SizedBox(height: Constants.padding / 2),
                FilledButton.tonal(
                  onPressed: () async {
                    final actorDetails = ref.read(actorDetailsProvider);
                    final studentId = actorDetails?.sessionInfo.uniNo ?? '';
                    final studentName =
                        '${actorDetails?.sessionInfo.actorName} - ${actorDetails?.sessionInfo.actorNameEn}';
                    final studentEmail =
                        actorDetails?.sessionInfo.academicMail ?? '';
                    final studentPhone = actorDetails?.sessionInfo.mobile ?? '';
                    final studentMajor =
                        actorDetails?.sessionInfo.majorName ?? '';
                    final studentJoinSemester =
                        actorDetails?.sessionInfo.joinSemester.toString() ?? '';
                    final studentCurrentSemester =
                        actorDetails?.sessionInfo.currentSemester ?? '';
                    final studentGender =
                        actorDetails?.sessionInfo.genderDes ?? '';
                    final studentPlanRemainingHours =
                        actorDetails?.sessionInfo.planRemainHrs ?? 0;
                    final studentPlanTakenHours =
                        actorDetails?.sessionInfo.planTakenHrs ?? 0;
                    final studentPlanTotalHours =
                        actorDetails?.sessionInfo.planTotalHrs ?? 0;

                    await ref
                        .read(feedbackViewModelProvider.notifier)
                        .sendFeedback(
                          studentId: studentId,
                          studentName: studentName,
                          studentEmail: studentEmail,
                          studentPhone: studentPhone,
                          studentMajor: studentMajor,
                          studentJoinSemester: studentJoinSemester,
                          studentCurrentSemester: studentCurrentSemester,
                          studentGender: studentGender,
                          studentRemainingHours: studentPlanRemainingHours,
                          studentTakenHours: studentPlanTakenHours,
                          studentTotalHours: studentPlanTotalHours,
                        );
                  },
                  child: switch (feedbackState.status) {
                    FeedbackStatus.sendingFeedback => const ButtonLoading(),
                    _ => Text(context.s.send),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? mapFeedbackTitleValidationErrorToText({
    required BuildContext context,
    required FeedbackTitleValidationError? error,
  }) {
    switch (error) {
      case FeedbackTitleValidationError.empty:
        return context.s.please_enter_a_title;
      case FeedbackTitleValidationError.lessThanThreeCharacters:
        return context.s.title_must_be_at_least_three_characters;
      case FeedbackTitleValidationError.moreThanOneHundredCharacters:
        return context.s.title_must_be_at_most_one_hundred_characters;
      default:
        return null;
    }
  }

  String? mapFeedbackCategoryValidationErrorToText({
    required BuildContext context,
    required FeedbackCategoryValidationError? error,
  }) {
    switch (error) {
      case FeedbackCategoryValidationError.empty:
        return context.s.please_select_a_category;
      default:
        return null;
    }
  }

  String? mapFeedbackBodyValidationErrorToText({
    required BuildContext context,
    required FeedbackBodyValidationError? error,
  }) {
    switch (error) {
      case FeedbackBodyValidationError.empty:
        return context.s.please_enter_a_body;
      case FeedbackBodyValidationError.lessThanTenCharacters:
        return context.s.body_must_be_at_least_ten_characters;
      case FeedbackBodyValidationError.moreThanOneThousandCharacters:
        return context.s.body_must_be_at_most_one_thousand_characters;
      default:
        return null;
    }
  }
}
