import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class PrivacyPolicyAndTermsOfUseWidget extends StatelessWidget {
  const PrivacyPolicyAndTermsOfUseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await url_launcher.launchUrl(
              Uri.parse(Constants.privacyPolicyUrl),
            );
          },
          child: Text(
            context.s.privacy_policy,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ),
        Text(
          ' • ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        GestureDetector(
          onTap: () async {
            await url_launcher.launchUrl(
              Uri.parse(Constants.termsOfUseUrl),
            );
          },
          child: Text(
            context.s.terms_of_use,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ),
      ],
    );
  }
}
