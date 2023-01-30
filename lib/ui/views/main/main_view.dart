import 'package:alyamamah/ui/views/home/home_view.dart';
import 'package:alyamamah/ui/views/main/main_view_model.dart';
import 'package:alyamamah/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainViewModel = ref.watch(mainViewModelProvider);

    return Scaffold(
      body: IndexedStack(
        index: mainViewModel.selectedIndex,
        children: const [
          HomeView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: mainViewModel.selectedIndex,
        onDestinationSelected:
            ref.read(mainViewModelProvider).onDestinationSelected,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
