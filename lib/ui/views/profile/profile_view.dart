import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/extensions/theme_mode.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:alyamamah/ui/views/profile/profile_view_model.dart';
import 'package:alyamamah/ui/views/profile/widgets/language_bottom_sheet.dart';
import 'package:alyamamah/ui/views/profile/widgets/theme_bottom_sheet.dart';
import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileViewModel = ref.watch(profileViewModelProvider);
    final themeService = ref.watch(themeServiceProvider);
    final actorDetails = ref.watch(actorDetailsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.profile),
        actions: [
          TextButton(
            onPressed: () async {
              await ref.read(profileViewModelProvider).restorePurchases();
            },
            child: profileViewModel.isRestoring
                ? const CircularProgressIndicator()
                : Text(context.s.restore),
          ),
          const SizedBox(width: Constants.spacing),
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person_rounded)),
              title: Text(
                Localizations.localeOf(context).languageCode == 'ar'
                    ? actorDetails?.sessionInfo.actorName ?? ''
                    : actorDetails?.sessionInfo.actorNameEn ?? '',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    actorDetails?.sessionInfo.academicMail ?? '',
                    style: Theme.of(context).textTheme.labelMedium,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () async {
                await ref
                    .read(profileViewModelProvider)
                    .navigateToStudentInfo();
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.smart_toy_rounded),
              ),
              title: Text(
                context.s.ask_alyamamah_gpt,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Constants.spacing),
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.padding / 2,
                      vertical: 0,
                    ),
                    child: Text(
                      context.s.new_word,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () async {
                await ref.read(profileViewModelProvider).navigateToYuGptView();
              },
            ),
            const SizedBox(height: Constants.padding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.padding,
              ),
              child: Text(
                context.s.appearance,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(height: Constants.spacing),
            ListTile(
              leading: Text(
                '🎨',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.theme),
              subtitle: Text(
                themeService.themeMode.mapToString(context),
              ),
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const ThemeBottomSheet();
                  },
                );
              },
            ),
            ListTile(
              leading: Text(
                '🌐',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.language),
              subtitle: Text(
                Locale(context.s.localeName).mapToString(context),
              ),
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const LanguageBottomSheet();
                  },
                );
              },
            ),
            const SizedBox(height: Constants.padding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.padding,
              ),
              child: Text(
                context.s.about_us,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(height: Constants.spacing),
            // ListTile(
            //   leading: Text(
            //     '⭐️',
            //     style: Theme.of(context).textTheme.headlineMedium,
            //   ),
            //   title: Text(
            //     context.s.rate_us_on_the_store(
            //       Theme.of(context).platform == TargetPlatform.iOS
            //           ? context.s.app_store
            //           : context.s.play_store,
            //     ),
            //   ),
            //   onTap: () {},
            // ),
            ListTile(
              leading: Text(
                '🐦',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.follow_us_on_twitter),
              onTap: () async {
                final canLaunch = await url_launcher.canLaunchUrl(
                  Uri.parse(Constants.twitterLink),
                );
                if (canLaunch) {
                  await url_launcher.launchUrl(
                    Uri.parse(Constants.twitterLink),
                  );
                }
              },
            ),
            ListTile(
              leading: Text(
                '％',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.semester_progress_tool),
              onTap: () async {
                final canLaunch = await url_launcher.canLaunchUrl(
                  Uri.parse(Constants.semesterProgressLink),
                );
                if (canLaunch) {
                  await url_launcher.launchUrl(
                    Uri.parse(Constants.semesterProgressLink),
                  );
                }
              },
            ),
            ListTile(
              leading: Text(
                '🗓️',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.tuwaiq_classrooms_tool),
              onTap: () async {
                final canLaunch = await url_launcher.canLaunchUrl(
                  Uri.parse(Constants.tuwaiqClassroomsLink),
                );
                if (canLaunch) {
                  await url_launcher.launchUrl(
                    Uri.parse(Constants.tuwaiqClassroomsLink),
                  );
                }
              },
            ),
            const SizedBox(height: Constants.padding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.padding,
              ),
              child: FilledButton.tonalIcon(
                icon: profileViewModel.isBusy
                    ? const SizedBox.shrink()
                    : const Icon(Icons.logout_rounded),
                label: profileViewModel.isBusy
                    ? const ButtonLoading()
                    : Text(context.s.logout),
                onPressed: () async {
                  await ref.read(profileViewModelProvider).logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
