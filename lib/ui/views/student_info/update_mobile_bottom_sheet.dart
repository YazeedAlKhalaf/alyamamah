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

class UpdateMobileBottomSheet extends ConsumerStatefulWidget {
  const UpdateMobileBottomSheet({super.key});

  @override
  ConsumerState<UpdateMobileBottomSheet> createState() =>
      _UpdateMobileBottomSheetState();
}

class _UpdateMobileBottomSheetState
    extends ConsumerState<UpdateMobileBottomSheet> {
  late TextEditingController mobileController;
  late GlobalKey<FormState> formKey;
  AutovalidateMode? autovalidateMode;
  bool isUpdating = false;
  String? error;

  @override
  void initState() {
    super.initState();

    mobileController = TextEditingController();
    mobileController.text =
        ref.read(actorDetailsProvider)?.sessionInfo.mobile ?? '';

    formKey = GlobalKey<FormState>();
  }

  Future<void> updateMobile(String mobile) async {
    setState(() {
      autovalidateMode = AutovalidateMode.onUserInteraction;
    });
    if (!formKey.currentState!.validate()) return;
    if (mobile == ref.read(actorDetailsProvider)?.sessionInfo.mobile) return;

    setState(() {
      isUpdating = true;
      error = null;
    });

    final locale = Localizations.localeOf(context);

    try {
      final apiService = ref.read(apiServiceProvider);
      await apiService.updateStudentInfo(
        email: ref.read(actorDetailsProvider)?.sessionInfo.email ?? '',
        mobile: mobile,
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
      title: context.s.update_mobile,
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
                  controller: mobileController,
                  decoration: InputDecoration(
                    labelText: context.s.mobile,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return context.s.enter_your_mobile;
                    }

                    if (!RegExp(r'^(05)(5|0|3|6|4|9|1|8|7)([0-9]{7})$')
                        .hasMatch(value)) {
                      return context.s.enter_valid_mobile;
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
                    await updateMobile(mobileController.text);
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
