import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/day.dart';
import 'package:alyamamah/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref.read(homeViewModelProvider).getStudentSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.my_courses),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: homeViewModel.isBusy ? Constants.padding : 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (homeViewModel.isBusy)
                const Center(child: CircularProgressIndicator())
              else
                Expanded(
                  child: PageView.builder(
                    controller: homeViewModel.pageController,
                    itemCount: homeViewModel.scheduleDays.keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      final currentDay =
                          homeViewModel.scheduleDays.keys.elementAt(index);
                      final scheduleEntryList =
                          homeViewModel.scheduleDays[currentDay];

                      return Column(
                        children: [
                          Text(
                            currentDay.mapToString(context),
                            textAlign: TextAlign.center,
                          ),
                          Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                await ref
                                    .read(homeViewModelProvider)
                                    .getStudentSchedule();
                              },
                              child: ListView.separated(
                                itemCount: scheduleEntryList?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  final scheduleEntry =
                                      scheduleEntryList![index];

                                  return ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: Constants.padding,
                                    ),
                                    leading: Text(
                                      '${scheduleEntry.startTime.format(context)}\n${scheduleEntry.endTime.format(context)}',
                                      textAlign: TextAlign.center,
                                    ),
                                    title: Text(
                                      scheduleEntry.courseName,
                                    ),
                                    subtitle: Text(
                                      scheduleEntry.room,
                                    ),
                                    trailing: Text(scheduleEntry.activityDesc),
                                    onTap: () {},
                                  );
                                },
                                separatorBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  final hasNextElement =
                                      index <= scheduleEntryList!.length - 1;

                                  if (hasNextElement) {
                                    final scheduleEntry =
                                        scheduleEntryList[index];
                                    final nextScheduleEntry =
                                        scheduleEntryList[index + 1];

                                    final hasBreak = scheduleEntry.endTime !=
                                        nextScheduleEntry.startTime;
                                    if (hasBreak) {
                                      return ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: Constants.padding,
                                        ),
                                        leading: Text(
                                          '☕️',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                        title: Text(context.s.break_word),
                                      );
                                    }
                                  }

                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
