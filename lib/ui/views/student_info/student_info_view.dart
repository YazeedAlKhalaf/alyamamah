import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/ui/views/student_info/student_info_view_model.dart';
import 'package:alyamamah/ui/views/student_info/update_email_bottom_sheet.dart';
import 'package:alyamamah/ui/views/student_info/update_mobile_bottom_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class StudentInfoView extends ConsumerWidget {
  const StudentInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorDetails = ref.watch(actorDetailsProvider);
    final studentInfoViewModel = ref.watch(studentInfoViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.student_information),
      ),
      body: SafeArea(
        child: studentInfoViewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  await ref
                      .read(studentInfoViewModelProvider)
                      .refreshStudentInfo(
                        locale: Localizations.localeOf(context),
                      );
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          '📱',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        title: Text(context.s.mobile),
                        subtitle: Text(actorDetails?.sessionInfo.mobile ?? ''),
                        trailing: TextButton(
                          child: Text(context.s.edit),
                          onPressed: () async {
                            await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const UpdateMobileBottomSheet();
                              },
                            );
                          },
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          '💌',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        title: Text(context.s.email),
                        subtitle: Text(actorDetails?.sessionInfo.email ?? ''),
                        trailing: TextButton(
                          child: Text(context.s.edit),
                          onPressed: () async {
                            await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const UpdateEmailBottomSheet();
                              },
                            );
                          },
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          '🎓',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        title: Text(context.s.degree),
                        subtitle: Text(
                            actorDetails?.sessionInfo.degreeCodeDesc ?? ''),
                      ),
                      ListTile(
                        leading: Text(
                          '🏢',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        title: Text(context.s.campus),
                        subtitle:
                            Text(actorDetails?.sessionInfo.campusName ?? ''),
                      ),
                      ListTile(
                        leading: Text(
                          '👨‍🏫',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        title: Text(context.s.faculty),
                        subtitle:
                            Text(actorDetails?.sessionInfo.facultyName ?? ''),
                      ),
                      ListTile(
                        leading: Text(
                          '📚',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        title: Text(context.s.major),
                        subtitle:
                            Text(actorDetails?.sessionInfo.majorName ?? ''),
                      ),
                      ListTile(
                        leading: Text(
                          '💻',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        title: Text(context.s.study_type),
                        subtitle:
                            Text(actorDetails?.sessionInfo.studyTypeDesc ?? ''),
                      ),
                      ListTile(
                        leading: Text(
                          '💡',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        title: Text(context.s.status),
                        subtitle:
                            Text(actorDetails?.sessionInfo.statusDesc ?? ''),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
