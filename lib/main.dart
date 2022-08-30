import 'package:alyamamah/app/view/app.dart';
import 'package:alyamamah/bootstrap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await bootstrap(
    () => const ProviderScope(
      child: App(),
    ),
  );
}
