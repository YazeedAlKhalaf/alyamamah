import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/api_service_exception_type.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/ui/views/student_info/student_info_view_model.dart';
import 'package:alyamamah/ui/widgets/yu_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateEmailBottomSheet extends ConsumerStatefulWidget {
  const UpdateEmailBottomSheet({super.key});

  @override
  ConsumerState<UpdateEmailBottomSheet> createState() =>
      _UpdateEmailBottomSheetState();
}

class _UpdateEmailBottomSheetState
    extends ConsumerState<UpdateEmailBottomSheet> {
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;
  AutovalidateMode? autovalidateMode;
  bool isUpdating = false;
  String? error;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    emailController.text =
        ref.read(actorDetailsProvider)?.sessionInfo.email ?? '';

    formKey = GlobalKey<FormState>();
  }

  Future<void> updateEmail(String email) async {
    setState(() {
      autovalidateMode = AutovalidateMode.onUserInteraction;
    });
    if (!formKey.currentState!.validate()) return;
    if (email == ref.read(actorDetailsProvider)?.sessionInfo.email) return;

    setState(() {
      isUpdating = true;
      error = null;
    });

    final locale = Localizations.localeOf(context);

    try {
      final apiService = ref.read(apiServiceProvider);
      await apiService.updateStudentInfo(
        email: email,
        mobile: ref.read(actorDetailsProvider)?.sessionInfo.mobile ?? '',
      );

      // refresh the student information screen.
      await ref
          .read(studentInfoViewModelProvider)
          .refreshStudentInfo(locale: locale);

      if (context.mounted) {
        Navigator.pop(context);
      }
    } on ApiServiceException catch (e) {
      setState(() {
        error = e.type.mapApiServiceExceptionType(context);
      });
    }

    setState(() {
      isUpdating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return YUBottomSheet(
      title: context.s.update_email,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: context.s.email,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return context.s.enter_your_email;
                    }

                    if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value)) {
                      return context.s.enter_valid_email;
                    }

                    return null;
                  },
                ),
                if (error != null) ...[
                  const SizedBox(height: Constants.padding),
                  Text(
                    error!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ],
                const SizedBox(height: Constants.padding),
                FilledButton.tonal(
                  onPressed: () async {
                    await updateEmail(emailController.text);
                  },
                  child: isUpdating
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Text(context.s.update),
                ),
                const SizedBox(height: Constants.padding),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
