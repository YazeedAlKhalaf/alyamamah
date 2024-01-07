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
                      context.s.steps_to_build_your_schedule,
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      context.s.process_should_take_3_5_minutes,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '1',
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      title: Text(
                        context.s.select_courses_you_plan_to_take,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '2',
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      title: Text(
                        context.s
                            .browse_all_the_possible_combinations_of_the_courses_sections_you_selected,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '3',
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      title: Text(
                        context.s
                            .register_the_courses_from_the_schedule_combination_you_like,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '4',
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      title: Text(
                        context.s
                            .if_you_didnt_pay_yet_you_will_be_redirected_to_the_official_payments_page,
                      ),
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
              label: Text(context.s.start_building_schedule),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
