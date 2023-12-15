import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/gen/proto/feedback.pb.dart' as feedbackpb;
import 'package:alyamamah/ui/views/feedback/feedback_state.dart';
import 'package:alyamamah/ui/views/feedback/feedback_view_model.dart';
import 'package:alyamamah/ui/widgets/error_view.dart';
import 'package:alyamamah/ui/widgets/section_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

@RoutePage()
class FeedbackListView extends ConsumerStatefulWidget {
  const FeedbackListView({super.key});

  @override
  ConsumerState<FeedbackListView> createState() => _FeedbackListViewState();
}

class _FeedbackListViewState extends ConsumerState<FeedbackListView> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await ref.read(feedbackViewModelProvider.notifier).getFeedbacks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final feedbackState = ref.watch(feedbackViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.feedbacks),
      ),
      body: switch (feedbackState.status) {
        FeedbackStatus.loadingFeedbacks => const Center(
            child: CircularProgressIndicator(),
          ),
        FeedbackStatus.errorLoadingFeedbacks => ErrorView(
            title: context.s.something_went_wrong,
            subtitle: context.s.error_loading_feedbacks,
            onRefresh: () async {
              await ref.read(feedbackViewModelProvider.notifier).getFeedbacks();
            },
          ),
        _ => RefreshIndicator(
            onRefresh: () async {
              await ref.read(feedbackViewModelProvider.notifier).getFeedbacks();
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SectionContainer(
                    showTopPadding: false,
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(
                            Icons.add_rounded,
                            size: 30,
                          ),
                        ),
                        title: Text(
                          context.s.create_feedback,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colorScheme.onSecondaryContainer,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                context
                                    .s.share_concerns_with_the_student_council,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () async {
                          await ref
                              .read(yuRouterProvider)
                              .push(const FeedbackRoute());
                        },
                      ),
                    ],
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.all(Constants.padding),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    context.s.your_feedbacks,
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.all(Constants.spacing),
                ),
                SliverList.separated(
                  itemCount: feedbackState.feedbacks.length,
                  itemBuilder: (context, index) {
                    final feedback = feedbackState.feedbacks[index];

                    final locale = Localizations.localeOf(context).languageCode;
                    final createdAtAsDateTime = feedback.createdAt.toDateTime();
                    final createdAtDay = intl.DateFormat.EEEE(locale).format(
                      createdAtAsDateTime,
                    );
                    final createdAtDate = intl.DateFormat.yMMMMd(locale).format(
                      createdAtAsDateTime,
                    );

                    return SectionContainer(
                      showTopPadding: false,
                      children: [
                        ListTile(
                          title: Text(
                            feedback.title,
                            style: context.textTheme.titleMedium?.copyWith(
                              color: context.colorScheme.onSecondaryContainer,
                            ),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.isArabic
                                    ? feedback.category.nameAr
                                    : feedback.category.nameEn,
                                style: context.textTheme.bodySmall,
                              ),
                              const SizedBox(height: Constants.spacing / 2),
                              Text(
                                '$createdAtDay, $createdAtDate',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color:
                                      context.colorScheme.onSecondaryContainer,
                                ),
                              ),
                              if (feedback.statuses.isNotEmpty) ...[
                                const SizedBox(height: Constants.spacing / 2),
                                FeedbackStatusChip(
                                  status: feedback.statuses.first,
                                ),
                              ],
                              const SizedBox(height: Constants.spacing / 2),
                              Text(
                                feedback.body,
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: Constants.padding);
                  },
                ),
              ],
            ),
          ),
      },
    );
  }
}

class FeedbackStatusChip extends StatelessWidget {
  final feedbackpb.FeedbackStatus status;

  const FeedbackStatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        context.isArabic ? status.nameAr : status.nameEn,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colorScheme.onTertiaryContainer,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.spacing),
      ),
      backgroundColor: context.colorScheme.tertiaryContainer,
    );
  }
}
