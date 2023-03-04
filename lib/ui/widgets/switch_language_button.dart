import 'package:alyamamah/ui/views/profile/widgets/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchLanguageButton extends ConsumerWidget {
  const SwitchLanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const LanguageBottomSheet();
          },
        );
      },
      icon: Text(
        '🌐',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
