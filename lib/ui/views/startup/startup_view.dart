import 'package:alyamamah/ui/views/startup/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartupView extends ConsumerStatefulWidget {
  const StartupView({super.key});

  @override
  ConsumerState<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends ConsumerState<StartupView> {
  @override
  void initState() {
    super.initState();

    ref.read(startupViewModelProvider).handleStartup();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
