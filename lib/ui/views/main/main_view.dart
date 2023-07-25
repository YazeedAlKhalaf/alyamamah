import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/absences/absences_view.dart';
import 'package:alyamamah/ui/views/chats/chats_view.dart';
import 'package:alyamamah/ui/views/courses/courses_view.dart';
import 'package:alyamamah/ui/views/grades/grades_view.dart';
import 'package:alyamamah/ui/views/main/main_view_model.dart';
import 'package:alyamamah/ui/views/profile/profile_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MainView extends ConsumerWidget {
  static final Key parentWidget = UniqueKey();

  @visibleForTesting
  final List<Widget>? pages;

  const MainView({
    super.key,
    this.pages,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainViewModel = ref.watch(mainViewModelProvider);

    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return Scaffold(
      key: parentWidget,
      body: Row(
        children: [
          if (isTablet)
            NavigationRail(
              selectedIndex: mainViewModel.selectedIndex,
              onDestinationSelected:
                  ref.read(mainViewModelProvider).onDestinationSelected,
              extended: mainViewModel.isExtended,
              minExtendedWidth: 180,
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.home_rounded),
                  label: Text(context.s.home),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.chat_rounded),
                  label: Text(context.s.chats),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.calendar_today_rounded),
                  label: Text(context.s.absences),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.grade_rounded),
                  label: Text(context.s.grades),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.person_rounded),
                  label: Text(context.s.profile),
                ),
              ],
              trailing: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (mainViewModel.isExtended)
                      FilledButton(
                        onPressed: () {
                          ref.read(mainViewModelProvider).toggleExtended();
                        },
                        child: Text(context.s.collapse),
                      )
                    else
                      IconButton(
                        onPressed: () {
                          ref.read(mainViewModelProvider).toggleExtended();
                        },
                        icon: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                  ],
                ),
              ),
            ),
          if (isTablet) const VerticalDivider(),
          Expanded(
            child: IndexedStack(
              index: mainViewModel.selectedIndex,
              children: pages ??
                  const [
                    CoursesView(),
                    ChatsView(),
                    AbsencesView(),
                    GradesView(),
                    ProfileView(),
                  ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isTablet
          ? null
          : NavigationBar(
              selectedIndex: mainViewModel.selectedIndex,
              onDestinationSelected:
                  ref.read(mainViewModelProvider).onDestinationSelected,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home_rounded),
                  label: context.s.my_courses,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.chat_rounded),
                  label: context.s.chats,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.calendar_today_rounded),
                  label: context.s.absences,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.grade_rounded),
                  label: context.s.grades,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.person_rounded),
                  label: context.s.profile,
                ),
              ],
            ),
    );
  }
}
