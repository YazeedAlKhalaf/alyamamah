import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/string.dart';
import 'package:alyamamah/ui/views/courses/course_details_view_model.dart';
import 'package:alyamamah/ui/widgets/yu_bottom_sheet.dart';
import 'package:alyamamah/ui/widgets/yu_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageLinkBottomSheet extends ConsumerStatefulWidget {
  final String section;

  const ManageLinkBottomSheet({
    super.key,
    required this.section,
  });

  @override
  ConsumerState<ManageLinkBottomSheet> createState() =>
      _ManageLinkBottomSheetState();
}

class _ManageLinkBottomSheetState extends ConsumerState<ManageLinkBottomSheet> {
  late TextEditingController linkController;
  late GlobalKey<FormState> formKey;
  AutovalidateMode? autovalidateMode;
  bool isUpdating = false;
  bool isDeleting = false;

  @override
  void initState() {
    super.initState();

    linkController = TextEditingController();
    linkController.text = ref.read(courseDetailsViewModelProvider).link ?? '';

    formKey = GlobalKey<FormState>();
  }

  Future<void> updateLink(String link) async {
    setState(() {
      autovalidateMode = AutovalidateMode.onUserInteraction;
    });
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isUpdating = true;
    });

    await ref.read(courseDetailsViewModelProvider).updateLink(
          section: widget.section,
          link: link,
        );

    setState(() {
      isUpdating = false;
    });

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> deleteLink() async {
    setState(() {
      isDeleting = true;
    });

    await ref.read(courseDetailsViewModelProvider).deleteLink(
          section: widget.section,
        );

    setState(() {
      isDeleting = false;
    });

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final courseDetailsViewModel = ref.read(courseDetailsViewModelProvider);
    final isLinkSet = courseDetailsViewModel.link != null;

    return YUBottomSheet(
      title: context.s.manage_link,
      description: context.s.manage_link_description,
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
                  controller: linkController,
                  decoration: InputDecoration(
                    labelText: context.s.link,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return context.s.link_cannot_be_empty;
                    }

                    if (!value.isValidUrl()) {
                      return context.s.enter_a_valid_link;
                    }

                    return null;
                  },
                  textDirection: TextDirection.ltr,
                ),
                const SizedBox(height: Constants.padding),
                FilledButton.tonal(
                  onPressed: () async {
                    await updateLink(linkController.text);
                  },
                  child: isUpdating
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          isLinkSet ? context.s.update : context.s.set,
                        ),
                ),
                const SizedBox(height: Constants.padding),
                if (isLinkSet) ...[
                  FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      foregroundColor: Theme.of(context).colorScheme.onError,
                    ),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return YUDialog(
                            title: context.s.delete_link,
                            description: context.s.you_sure_delete_link,
                            noOnPressed: () {
                              Navigator.pop(context);
                            },
                            yesOnPressed: () async {
                              Navigator.pop(context);
                              await deleteLink();
                            },
                          );
                        },
                      );
                    },
                    child: isDeleting
                        ? const SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(),
                          )
                        : Text(context.s.delete),
                  ),
                  const SizedBox(height: Constants.padding),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
