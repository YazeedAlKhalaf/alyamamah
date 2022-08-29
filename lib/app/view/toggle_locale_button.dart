import 'package:alyamamah/app/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleLocaleButton extends ConsumerWidget {
  const ToggleLocaleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeNotifier = ref.read(localeProvider.notifier);
    final locale = ref.watch(localeProvider);

    return IconButton(
      icon: locale.languageCode == 'ar'
          ? const Text('English')
          : const Text('عربي'),
      onPressed: () {
        localeNotifier.toggleLocale();
      },
    );
  }
}
