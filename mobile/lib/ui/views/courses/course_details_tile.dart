import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CourseDetailsTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;

  const CourseDetailsTile({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        emoji,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: IconButton(
        icon: const Icon(Icons.copy_rounded),
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: subtitle));
        },
      ),
    );
  }
}
