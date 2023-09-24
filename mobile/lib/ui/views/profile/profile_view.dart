import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/extensions/string.dart';
import 'package:alyamamah/core/extensions/theme_mode.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:alyamamah/ui/views/profile/profile_view_model.dart';
import 'package:alyamamah/ui/views/profile/widgets/language_bottom_sheet.dart';
import 'package:alyamamah/ui/views/profile/widgets/theme_bottom_sheet.dart';
import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:alyamamah/ui/widgets/privacy_policy_and_terms_of_use_widget.dart';
import 'package:alyamamah/ui/widgets/section_container.dart';
import 'package:alyamamah/ui/widgets/yu_show.dart';
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
        title: Text(
          context.s.profile,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SectionContainer(
              showTopPadding: false,
              children: [
                ListTile(
                  leading:
                      const CircleAvatar(child: Icon(Icons.person_rounded)),
                  title: Text(
                    (Localizations.localeOf(context).languageCode == 'ar'
                            ? actorDetails?.sessionInfo.actorName ?? ''
                            : (actorDetails?.sessionInfo.actorNameEn ?? '')
                                .toTitleCase())
                        .toTwoNamesMaximum(),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        actorDetails?.sessionInfo.academicMail ?? '',
                        style: context.textTheme.bodyMedium,
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
              ],
            ),
            const SizedBox(height: Constants.padding),
            SectionContainer(
              children: [
                Text(
                  context.s.appearance,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  leading: Text(
                    '🎨',
                    style: context.textTheme.headlineMedium,
                  ),
                  title: Text(
                    context.s.theme,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  subtitle: Text(
                    themeService.themeMode.mapToString(context),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () async {
                    await YUShow.modalBottomSheet(
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
                    style: context.textTheme.headlineMedium,
                  ),
                  title: Text(
                    context.s.language,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  subtitle: Text(
                    Locale(context.s.localeName).mapToString(context),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () async {
                    await YUShow.modalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const LanguageBottomSheet();
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: Constants.padding),
            SectionContainer(
              children: [
                Text(
                  context.s.about_us,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ListTile(
                //   leading: Text(
                //     '⭐️',
                //     style: context.textTheme.headlineMedium,
                //   ),
                //   title: Text(
                //     context.s.rate_us_on_the_store(
                //       context.platform == TargetPlatform.iOS
                //           ? context.s.app_store
                //           : context.s.play_store,
                //     ),
                //   ),
                //   onTap: () {},
                // ),
                ListTile(
                  leading: Text(
                    '𝕏',
                    style: context.textTheme.headlineMedium,
                  ),
                  title: Text(
                    context.s.follow_us_on_twitter,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
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
                    style: context.textTheme.headlineMedium,
                  ),
                  title: Text(
                    context.s.semester_progress_tool,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
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
                    '📆',
                    style: context.textTheme.headlineMedium,
                  ),
                  title: Text(
                    context.s.tuwaiq_rooms_tool,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
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
              ],
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
            const SizedBox(height: Constants.padding),
            const PrivacyPolicyAndTermsOfUseWidget(),
            const SizedBox(height: Constants.padding),
          ],
        ),
      ),
    );
  }
}
