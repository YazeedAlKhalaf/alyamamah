import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentInfoView extends ConsumerWidget {
  const StudentInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorDetails = ref.watch(actorDetailsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.student_information),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  '📱',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(context.s.mobile),
                subtitle: Text(actorDetails?.sessionInfo.mobile ?? ''),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '💌',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(context.s.email),
                subtitle: Text(actorDetails?.sessionInfo.email ?? ''),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '🎓',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(context.s.degree),
                subtitle: Text(actorDetails?.sessionInfo.degreeCodeDesc ?? ''),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '🏢',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(context.s.campus),
                subtitle: Text(actorDetails?.sessionInfo.campusName ?? ''),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '👨‍🏫',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(context.s.faculty),
                subtitle: Text(actorDetails?.sessionInfo.facultyName ?? ''),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '📚',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(context.s.major),
                subtitle: Text(actorDetails?.sessionInfo.majorName ?? ''),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '💻',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(context.s.study_type),
                subtitle: Text(actorDetails?.sessionInfo.studyTypeDesc ?? ''),
                onTap: () {},
              ),
              ListTile(
                leading: Text(
                  '💡',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(context.s.status),
                subtitle: Text(actorDetails?.sessionInfo.statusDesc ?? ''),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
