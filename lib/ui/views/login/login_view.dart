import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.login),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: context.s.username,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: context.s.password,
                ),
                obscureText: true,
              ),
              const SizedBox(height: Constants.padding),
              FilledButton(
                onPressed: () {},
                child: Text(context.s.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
