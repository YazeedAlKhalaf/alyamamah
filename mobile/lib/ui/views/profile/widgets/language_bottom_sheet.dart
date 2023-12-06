import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/services/locale/locale_service.dart';
import 'package:alyamamah/ui/widgets/yu_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageBottomSheet extends ConsumerWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeService = ref.watch(localeServiceProvider);

    return YUBottomSheet(
      title: context.s.language,
      children: S.supportedLocales.map((Locale locale) {
        final isSelected = localeService.locale == locale ||
            context.s.localeName == locale.languageCode;

        return ListTile(
          leading: Text(
            locale.mapToEmoji(context),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          title: Text(locale.mapToString(context)),
          trailing: isSelected ? const Icon(Icons.check_rounded) : null,
          onTap: () async {
            await localeService.setLocale(locale);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        );
      }).toList(),
    );
  }
}
