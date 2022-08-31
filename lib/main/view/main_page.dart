import 'package:alyamamah/l10n/l10n.dart';
import 'package:alyamamah/main/provider/main_provider.dart';
import 'package:alyamamah/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainNotifier = ref.read(mainProvider.notifier);
    final mainState = ref.watch(mainProvider);

    return Scaffold(
      body: IndexedStack(
        index: mainState.navigationBarIndex,
        children: const [
          Text('home'),
          Text('course'),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: mainState.navigationBarIndex,
        onDestinationSelected: mainNotifier.setNavigationBarIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_rounded),
            label: context.l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.library_books_rounded),
            label: context.l10n.courses,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_rounded),
            label: context.l10n.profile,
          ),
        ],
      ),
    );
  }
}
