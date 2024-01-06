import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ScheduleBuilderIntroView extends ConsumerWidget {
  const ScheduleBuilderIntroView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.schedule_builder),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const Text(
              '👷‍♂️🧱👷‍♀️',
              style: TextStyle(
                fontSize: 100,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Steps to Build Your Schedule',
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      'Process should take 3-5 minutes',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.list),
                      title: Text('Select courses you plan to take'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Browse all the possible combinations'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.check_circle),
                      title:
                          Text('Register your the courses, and pay if needed!'),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            FilledButton.tonalIcon(
              onPressed: () async {
                await ref
                    .read(yuRouterProvider)
                    .push(const OfferedCoursesRoute());
              },
              icon: const Icon(Icons.calendar_month_rounded),
              label: Text(context.s.build_my_schedule),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
