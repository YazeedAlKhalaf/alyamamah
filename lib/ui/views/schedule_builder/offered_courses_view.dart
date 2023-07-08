import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/ui/views/schedule_builder/offered_course_hours_card.dart';
import 'package:alyamamah/ui/views/schedule_builder/offered_course_list_tile.dart';
import 'package:alyamamah/ui/views/schedule_builder/offered_courses_view_model.dart';
import 'package:alyamamah/ui/views/schedule_builder/offered_courses_view_state.dart';
import 'package:alyamamah/ui/widgets/empty_view.dart';
import 'package:alyamamah/ui/widgets/error_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class OfferedCoursesView extends ConsumerStatefulWidget {
  const OfferedCoursesView({super.key});

  @override
  ConsumerState<OfferedCoursesView> createState() => _OfferedCoursesViewState();
}

class _OfferedCoursesViewState extends ConsumerState<OfferedCoursesView> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await ref
          .read(offeredCoursesViewModelProvider.notifier)
          .getOfferedCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final offeredCoursesViewState = ref.watch(offeredCoursesViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.offered_courses),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60 + Constants.padding),
          child: switch (offeredCoursesViewState.registrationHours) {
            null => const SizedBox(),
            _ => () {
                final registrationHours =
                    offeredCoursesViewState.registrationHours!;

                return Padding(
                  padding: const EdgeInsets.only(bottom: Constants.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: Constants.padding),
                      Expanded(
                        flex: 2,
                        child: OfferedCourseHoursCard(
                          text: context.s.min_x(registrationHours.minHrs),
                        ),
                      ),
                      const SizedBox(width: Constants.spacing),
                      Expanded(
                        flex: 2,
                        child: OfferedCourseHoursCard(
                          text: context.s.max_x(registrationHours.maxHrs),
                        ),
                      ),
                      const SizedBox(width: Constants.spacing),
                      Expanded(
                        flex: 2,
                        child: OfferedCourseHoursCard(
                          text: context.s
                              .attempted_x(registrationHours.attemptedHrs),
                        ),
                      ),
                      const SizedBox(width: Constants.spacing),
                      Expanded(
                        flex: 3,
                        child: OfferedCourseHoursCard(
                          text: context.s.selected_x(
                            offeredCoursesViewState.selectedHours,
                          ),
                          color: context.colorScheme.tertiaryContainer,
                          textColor: context.colorScheme.onTertiaryContainer,
                        ),
                      ),
                      const SizedBox(width: Constants.padding),
                    ],
                  ),
                );
              }()
          },
        ),
      ),
      body: switch (offeredCoursesViewState.status) {
        OfferedCoursesViewStatus.loading ||
        OfferedCoursesViewStatus.unknown =>
          const Center(
            child: CircularProgressIndicator(),
          ),
        OfferedCoursesViewStatus.errorLoading => ErrorView(
            title: context.s.something_went_wrong_fetching_your_offered_courses,
            subtitle: context.s.please_try_again,
            onRefresh: () async {
              await ref
                  .read(offeredCoursesViewModelProvider.notifier)
                  .getOfferedCourses();
            },
          ),
        OfferedCoursesViewStatus.loaded => () {
            if (offeredCoursesViewState.offeredCourses.isEmpty) {
              return EmptyView(
                title: context.s.no_offered_courses_found,
                subtitle: context.s
                    .wait_till_the_university_releases_the_courses_or_talk_to_your_advisor,
                onRefresh: () async {
                  await ref
                      .read(offeredCoursesViewModelProvider.notifier)
                      .getOfferedCourses();
                },
              );
            }

            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await ref
                          .read(offeredCoursesViewModelProvider.notifier)
                          .getOfferedCourses();
                    },
                    child: ListView.builder(
                      itemCount: offeredCoursesViewState.offeredCourses.length,
                      itemBuilder: (BuildContext context, int index) {
                        final offeredCourse =
                            offeredCoursesViewState.offeredCourses[index];

                        return OfferedCourseListTile(
                          offeredCourse: offeredCourse,
                          isSelected: offeredCoursesViewState
                              .selectedCourseCodes
                              .contains(offeredCourse.courseCode),
                          onTap: () {
                            ref
                                .read(offeredCoursesViewModelProvider.notifier)
                                .toggleOfferedCourse(offeredCourse.courseCode);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }()
      },
      bottomNavigationBar: BottomAppBar(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: offeredCoursesViewState.selectedHours >
                          (offeredCoursesViewState.registrationHours?.maxHrs ??
                              0) ||
                      offeredCoursesViewState.selectedHours <
                          (offeredCoursesViewState.registrationHours?.minHrs ??
                              99999)
                  ? null
                  : () async {
                      await ref.read(yuRouterProvider).push(
                            ScheduleBuilderRoute(
                              offeredCourses: offeredCoursesViewState
                                  .selectedOfferedCourses,
                            ),
                          );
                    },
              child: Text(
                context.s.next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
