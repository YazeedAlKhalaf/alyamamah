import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/ui/views/chats/chats_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ChatView extends ConsumerStatefulWidget {
  final CubeDialog chat;

  const ChatView({
    super.key,
    required this.chat,
  });

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  Schedule? schedule;

  @override
  void initState() {
    super.initState();

    final sectionSeq = widget.chat.name?.split('-')[1] ?? '';
    schedule = ref
        .read(chatsViewModelProvider)
        .schedules
        .firstWhereOrNull((schedule) => schedule.sectionSeq == sectionSeq);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(schedule?.courseCode ?? ''),
      ),
      body: const Placeholder(),
    );
  }
}
