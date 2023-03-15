import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/absences/absences_view.dart';
import 'package:alyamamah/ui/views/home/home_view.dart';
import 'package:alyamamah/ui/views/main/main_view_model.dart';
import 'package:alyamamah/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  icon: const Icon(Icons.calendar_today_rounded),
                  label: Text(context.s.absences),
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
                    HomeView(),
                    AbsencesView(),
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
                  label: context.s.home,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.calendar_today_rounded),
                  label: context.s.absences,
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
