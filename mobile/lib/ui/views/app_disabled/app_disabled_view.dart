import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/services/locale/locale_service.dart';
import 'package:alyamamah/ui/widgets/yu_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class AppDisabledView extends StatelessWidget {
  const AppDisabledView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.padding * 2,
          ),
          child: ListView(
            children: [
              const Row(
                children: [
                  SwitchLanguageButton(),
                ],
              ),
              const SizedBox(height: Constants.spacing * 4),
              const Text(
                '😢',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 100,
                ),
              ),
              const SizedBox(height: Constants.spacing / 2),
              Text(
                context.s.temporary_maintenance,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Constants.spacing * 2),
              Text(
                context.s.temporary_maintenance_description,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: Constants.spacing * 2),
              Text(
                context.s.for_any_concerns_or_feedback_feel_free_to_reach_out,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: Constants.spacing),
              FilledButton.tonalIcon(
                icon: const Icon(Icons.email),
                label: Text(
                  context.s.email_x('yazeedfady@gmail.com'),
                ),
                onPressed: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'yazeedfady@gmail.com',
                    queryParameters: {
                      'subject': '[AlYamamah App] Feedback',
                    },
                  );

                  final canLaunch = await url_launcher.canLaunchUrl(emailUri);
                  if (canLaunch) {
                    await url_launcher.launchUrl(emailUri);
                  } else if (context.mounted) {
                    YUSnackBar.show(
                      context,
                      message: context.s.failed_to_launch_email_app,
                    );
                  }
                },
              ),
              const SizedBox(height: Constants.spacing),
              FilledButton.tonalIcon(
                icon: Text(
                  '𝕏',
                  style: context.textTheme.headlineMedium,
                ),
                label: Text(
                  context.s.twitter_dm,
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  final canLaunch = await url_launcher.canLaunchUrl(
                    Uri.parse(Constants.twitterLink),
                  );
                  if (canLaunch) {
                    await url_launcher.launchUrl(
                      Uri.parse(Constants.twitterLink),
                    );
                  } else if (context.mounted) {
                    YUSnackBar.show(
                      context,
                      message: context.s.failed_to_launch_twitter_app,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchLanguageButton extends ConsumerWidget {
  const SwitchLanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeService = ref.watch(localeServiceProvider);
    final isArabic = localeService.locale?.languageCode == 'ar';

    return FilledButton.tonal(
      onPressed: () {
        localeService.setLocale(
          isArabic ? const Locale('en') : const Locale('ar'),
          onlyChangeLocale: true,
        );
      },
      child: Text(
        isArabic ? '🇺🇸' : '🇸🇦',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
