import 'package:alyamamah/app/provider/locale_provider.dart';
import 'package:alyamamah/app/repository/yamamah_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleLocaleButton extends ConsumerStatefulWidget {
  const ToggleLocaleButton({super.key});

  @override
  ConsumerState<ToggleLocaleButton> createState() => _ToggleLocaleButtonState();
}

class _ToggleLocaleButtonState extends ConsumerState<ToggleLocaleButton> {
  bool isChangingLanguage = false;

  @override
  Widget build(BuildContext context) {
    final localeNotifier = ref.read(localeProvider.notifier);
    final locale = ref.watch(localeProvider);

    return FilledButton.tonal(
      onPressed: isChangingLanguage
          ? null
          : () async {
              setState(() {
                isChangingLanguage = true;
              });
              await ref.read(yamamahRepositoryProvider).changeLanguage(
                    currentLocale: locale,
                  );
              setState(() {
                isChangingLanguage = false;
              });
              await localeNotifier.toggleLocale();
            },
      child: isChangingLanguage
          ? const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
            )
          : locale.languageCode == 'ar'
              ? const Text('English')
              : const Text('عربي'),
    );
  }
}
