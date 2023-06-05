import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/rev_cat/rev_cat_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:alyamamah/ui/views/yu_gpt/gpt_message_item.dart';
import 'package:alyamamah/ui/views/yu_gpt/yu_gpt_state.dart';
import 'package:alyamamah/ui/views/yu_gpt/yu_gpt_view_model.dart';
import 'package:alyamamah/ui/widgets/yu_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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

    ref.read(yuGptViewModelProvider.notifier).addListener(
      (YuGptState yuGptState) async {
        if (yuGptState.errorType == YuApiServiceExceptionType.paymentRequired) {
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

          await ref.read(yuRouterProvider).push(
                PaywallRoute(
                  title: title,
                  description: description,
                  packages: offering.availablePackages,
                  customerInfo: customerInfo,
                ),
              );
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
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.padding,
              ),
              child: ListView.separated(
                reverse: true,
                itemCount: yuGptState.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = yuGptState.messages.reversed.toList()[index];

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
          const SizedBox(height: Constants.spacing),
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
