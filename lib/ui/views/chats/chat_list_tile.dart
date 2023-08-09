import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/connecty_cube/connecty_cube_service.dart';
import 'package:alyamamah/ui/views/chats/chats_view_model.dart';
import 'package:collection/collection.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListTile extends ConsumerStatefulWidget {
  final CubeDialog chat;

  const ChatListTile({
    super.key,
    required this.chat,
  });

  @override
  ConsumerState<ChatListTile> createState() => _ChatListTileState();
}

class _ChatListTileState extends ConsumerState<ChatListTile> {
  String lastMessageUserName = '';
  Schedule? schedule;

  @override
  void initState() {
    super.initState();

    final sectionSeq = widget.chat.name?.split('-')[1] ?? '';
    schedule = ref
        .read(chatsViewModelProvider)
        .schedules
        .firstWhereOrNull((schedule) => schedule.sectionSeq == sectionSeq);

    Future(() async {
      if (widget.chat.lastMessageUserId == null) return;

      final user = await ref.read(connectyCubeServiceProvider).getUserUsingId(
            userId: widget.chat.lastMessageUserId!,
          );

      if (user != null) {
        setState(() {
          lastMessageUserName = user.externalUserId ?? '';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
      ),
      child: ListTile(
        tileColor: context.colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Constants.padding,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Constants.padding,
        ),
        leading: CircleAvatar(
          backgroundColor: context.colorScheme.tertiary,
        ),
        title: Text(
          schedule?.courseCode ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onSecondaryContainer,
          ),
        ),
        subtitle: Text(lastMessageUserName),
        trailing: switch (widget.chat.unreadMessageCount) {
          null || 0 => const Icon(Icons.chevron_right_rounded),
          _ => CircleAvatar(
              backgroundColor: context.colorScheme.primary,
              radius: 10,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(
                  child: Text(
                    widget.chat.unreadMessageCount! > 99
                        ? '99+'
                        : widget.chat.unreadMessageCount!.toString(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        },
        onTap: () async {
          if (ref.read(connectyCubeServiceProvider).currentUser == null) return;
          await ref.read(yuRouterProvider).push(ChatRoute(
                cubeUser: ref.read(connectyCubeServiceProvider).currentUser!,
                chat: widget.chat,
              ));
        },
      ),
    );
  }
}
