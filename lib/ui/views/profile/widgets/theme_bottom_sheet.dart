import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/theme_mode.dart';
import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:alyamamah/ui/widgets/yu_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeBottomSheet extends ConsumerWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeService = ref.watch(themeServiceProvider);

    return YUBottomSheet(
      title: context.s.theme,
      children: ThemeMode.values.map((ThemeMode themeMode) {
        return ListTile(
          leading: Text(
            themeMode.mapToEmoji(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          title: Text(themeMode.mapToString(context)),
          trailing: themeService.themeMode == themeMode
              ? const Icon(Icons.check_rounded)
              : null,
          onTap: () {
            themeService.setThemeMode(themeMode);
            Navigator.pop(context);
          },
        );
      }).toList(),
    );
  }
}
