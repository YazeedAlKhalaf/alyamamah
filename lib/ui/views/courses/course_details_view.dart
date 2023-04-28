import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/courses/course_details_tile.dart';
import 'package:alyamamah/ui/views/courses/course_details_view_model.dart';
import 'package:alyamamah/ui/views/courses/manage_link_bottom_sheet.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/widgets/yu_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

@RoutePage()
class CourseDetailsView extends ConsumerStatefulWidget {
  final ScheduleEntry scheduleEntry;

  const CourseDetailsView({
    super.key,
    required this.scheduleEntry,
  });

  @override
  ConsumerState<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends ConsumerState<CourseDetailsView> {
  late final Logger _log;

  @override
  void initState() {
    super.initState();

    _log = Logger('CourseDetailsView');

    ref.read(courseDetailsViewModelProvider).initialize(
          section: widget.scheduleEntry.section,
        );
  }

  @override
  Widget build(BuildContext context) {
    final courseDetailsViewModel = ref.watch(courseDetailsViewModelProvider);
    final isLinkSet = courseDetailsViewModel.link != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.scheduleEntry.courseName),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: Text(
                '🔗',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(
                isLinkSet ? courseDetailsViewModel.link! : context.s.link,
              ),
              subtitle: Text(
                isLinkSet
                    ? context.s.click_here_to_open_the_link
                    : context.s.click_set_to_define_the_link,
              ),
              trailing: TextButton(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return ManageLinkBottomSheet(
                        section: widget.scheduleEntry.section,
                      );
                    },
                  );
                },
                child: Text(isLinkSet ? context.s.edit : context.s.set),
              ),
              onTap: isLinkSet
                  ? () async {
                      if (courseDetailsViewModel.link != null) {
                        try {
                          await url_launcher.launchUrl(
                            Uri.parse(courseDetailsViewModel.link!),
                          );
                        } catch (e) {
                          _log.severe(
                            'could not open link: ${courseDetailsViewModel.link}',
                            e,
                          );
                          YUSnackBar.show(
                            context,
                            message: context.s.failed_to_open_link,
                          );
                        }
                      }
                    }
                  : null,
            ),
            CourseDetailsTile(
              emoji: '🆔',
              title: context.s.course_code,
              subtitle: widget.scheduleEntry.courseCode,
            ),
            CourseDetailsTile(
              emoji: '🚪',
              title: context.s.room,
              subtitle: widget.scheduleEntry.room,
            ),
            CourseDetailsTile(
              emoji: '🔢',
              title: context.s.section,
              subtitle: widget.scheduleEntry.section,
            ),
            CourseDetailsTile(
              emoji: '📝',
              title: context.s.activity_description,
              subtitle: widget.scheduleEntry.activityDesc,
            ),
            CourseDetailsTile(
              emoji: '👨‍🏫',
              title: context.s.instructor,
              subtitle: widget.scheduleEntry.instructor,
            ),
            CourseDetailsTile(
              emoji: '⏰',
              title: context.s.credit_hours,
              subtitle: widget.scheduleEntry.creditHours,
            ),
            CourseDetailsTile(
              emoji: '🏫',
              title: context.s.campus_name,
              subtitle: widget.scheduleEntry.campusName,
            ),
            CourseDetailsTile(
              emoji: '🗑️',
              title: context.s.course_deleted_q,
              subtitle: widget.scheduleEntry.courseDeleted
                  ? context.s.yes
                  : context.s.no,
            ),
          ],
        ),
      ),
    );
  }
}
