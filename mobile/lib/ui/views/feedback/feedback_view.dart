import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/gen/proto/feedback.pbgrpc.dart';
import 'package:alyamamah/ui/views/feedback/feedback_state.dart';
import 'package:alyamamah/ui/views/feedback/feedback_view_model.dart';
import 'package:alyamamah/ui/widgets/conditional_widget.dart';
import 'package:alyamamah/ui/widgets/shimmer_loading.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FeedbackView extends ConsumerStatefulWidget {
  const FeedbackView({super.key});

  @override
  ConsumerState<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends ConsumerState<FeedbackView> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await ref
          .read(feedbackViewModelProvider.notifier)
          .getFeedbackCategories();
    });
  }

  List<DropdownMenuItem<FeedbackCategory>> getFeedbackCategoryItems({
    required List<FeedbackCategory> feedbackCategories,
    required Locale locale,
  }) {
    return feedbackCategories.map(
      (feedbackCategory) {
        final text = locale.languageCode == 'ar'
            ? feedbackCategory.nameAr
            : feedbackCategory.nameEn;
        return DropdownMenuItem(
          value: feedbackCategory,
          child: Text(text),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final feedbackState = ref.watch(feedbackViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.feedback_for_student_council),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Constants.padding),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: context.s.title,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Constants.padding,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Constants.padding),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: ConditionalWidget(
                          condition: feedbackState.status ==
                              FeedbackStatus.errorLoadingCategories,
                          showTrue: Text(
                            context.s.failed_to_load_feedback_categories,
                          ),
                          showFalse: ShimmerLoading(
                            isLoading: feedbackState.status ==
                                FeedbackStatus.loadingCategories,
                            child: DropdownButtonFormField<FeedbackCategory>(
                              items: getFeedbackCategoryItems(
                                feedbackCategories: feedbackState.categories,
                                locale: Localizations.localeOf(context),
                              ),
                              onChanged: (_) {},
                              decoration: InputDecoration(
                                labelText: context.s.category,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Constants.padding,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Constants.padding),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: context.s.body,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Constants.padding,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Constants.padding),
                FilledButton.tonal(
                  onPressed: () {},
                  child: Text(context.s.submit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
