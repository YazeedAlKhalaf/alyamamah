import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/yu_api_service_exception_type.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/rev_cat/rev_cat_service.dart';
import 'package:alyamamah/core/services/yu_api/models/model_name.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:alyamamah/ui/views/yu_gpt/gpt_message_item.dart';
import 'package:alyamamah/ui/views/yu_gpt/yu_gpt_state.dart';
import 'package:alyamamah/ui/views/yu_gpt/yu_gpt_view_model.dart';
import 'package:alyamamah/ui/widgets/yu_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

@RoutePage()
class YuGptView extends ConsumerStatefulWidget {
  const YuGptView({super.key});

  @override
  ConsumerState<YuGptView> createState() => _YuGptViewState();
}

class _YuGptViewState extends ConsumerState<YuGptView> {
  late final TextEditingController messageController;
  TextDirection? messageFieldTextDirection;

  @override
  void initState() {
    super.initState();

    messageController = TextEditingController();

    ref.listenManual<YuGptState>(
      yuGptViewModelProvider,
      (YuGptState? previous, YuGptState current) async {
        if (previous == current) return;

        if (current.errorType == YuApiServiceExceptionType.paymentRequired) {
          try {
            final title = context.s.alyamamah_gpt;
            final description = context.s.you_need_to_subscribe_first;
            final noOfferingsText =
                context.s.we_couldnt_find_any_offerings_for_you;

            final customerInfo =
                await ref.read(revCatServiceProvider).getCustomerInfo();

            final offerings =
                await ref.read(revCatServiceProvider).getOfferings();

            final offering = offerings.all[Constants.defaultOfferingId];
            if (offering == null) {
              if (context.mounted) {
                YUSnackBar.show(
                  context,
                  message: noOfferingsText,
                );
              }
              return;
            }

            print('ahmad is cool!');
            await ref.read(yuRouterProvider).push(
                  PaywallRoute(
                    title: title,
                    description: description,
                    packages: offering.availablePackages,
                    customerInfo: customerInfo,
                  ),
                );
          } catch (e) {
            if (context.mounted) {
              YUSnackBar.show(
                context,
                message: context.s.unknown_service_error,
              );
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final yuGptState = ref.watch(yuGptViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.ask_alyamamah_gpt),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              ref.read(yuGptViewModelProvider.notifier).clearMessages();
            },
            icon: const Icon(Icons.delete_forever_rounded),
          ),
        ],
        bottom: yuGptState.messages.isNotEmpty
            ? null
            : PreferredSize(
                preferredSize: const Size(double.infinity, 70),
                child: Padding(
                  padding: const EdgeInsets.all(Constants.padding),
                  child: Row(
                    children: [
                      Expanded(
                        child: SegmentedButton<ModelName>(
                          showSelectedIcon: false,
                          segments: [
                            ButtonSegment(
                              value: ModelName.gpt3_5turbo,
                              label: Text(ModelName.gpt3_5turbo.displayName),
                              icon: const Icon(Icons.flash_on_rounded),
                            ),
                            ButtonSegment(
                              value: ModelName.gpt4,
                              label: Text(ModelName.gpt4.displayName),
                              icon: const Icon(Icons.auto_awesome_rounded),
                            ),
                          ],
                          selected: {yuGptState.modelName},
                          onSelectionChanged: (Set<ModelName> modelNameSet) {
                            if (modelNameSet.isNotEmpty) {
                              ref
                                  .read(yuGptViewModelProvider.notifier)
                                  .setModelName(modelNameSet.first);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      body: Column(
        children: [
          if (yuGptState.messages.isEmpty)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.smart_toy_rounded),
                  ),
                  const SizedBox(height: Constants.spacing),
                  Text(
                    context.s.your_best_companion_for_school_work,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ).animate().scale(duration: 300.milliseconds)
          else
            Expanded(
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.padding,
                  ),
                  child: ListView.separated(
                    reverse: true,
                    itemCount: yuGptState.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message =
                          yuGptState.messages.reversed.toList()[index];

                      return GptMessageItem(
                        message: message,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: Constants.padding);
                    },
                  ),
                ),
              ),
            ),
          const SizedBox(height: Constants.spacing),
          if (yuGptState.errorType != null)
            ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.padding,
                ),
                child: Text(
                  yuGptState.errorType!.mapToString(context),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: Constants.spacing),
            ].animate().scale(duration: 300.milliseconds),
          Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.padding,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: context.s.type_your_message_here,
                          ),
                          textDirection: messageFieldTextDirection,
                          minLines: 1,
                          maxLines: 10,
                          onChanged: (String value) {
                            setState(() {
                              messageFieldTextDirection = value.isEmpty
                                  ? null
                                  : intl.Bidi.detectRtlDirectionality(value)
                                      ? TextDirection.rtl
                                      : TextDirection.ltr;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: Constants.spacing),
                      IconButton(
                        icon: const Icon(Icons.send_rounded),
                        onPressed: yuGptState.isGenerating
                            ? null
                            : () {
                                if (messageController.text.isEmpty) return;

                                ref
                                    .read(yuGptViewModelProvider.notifier)
                                    .sendMessage(
                                      messageController.text,
                                    );

                                messageController.clear();
                              },
                      ),
                    ],
                  ).animate().slideY(),
                  const SizedBox(height: Constants.spacing),
                  AnimatedContainer(
                    height: yuGptState.modelName == ModelName.gpt4 ? 20 : 0,
                    duration: 300.milliseconds,
                    child: yuGptState.modelName == ModelName.gpt4
                        ? Text(
                            context.s.gpt_4_limits_message,
                            style: Theme.of(context).textTheme.labelSmall,
                          ).animate().fadeIn(
                              duration: 300.milliseconds,
                              delay: 100.milliseconds,
                              curve: Curves.easeInOut,
                            )
                        : null,
                  ),
                  const SizedBox(height: Constants.spacing),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
