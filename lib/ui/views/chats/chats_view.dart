import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/chats/chats_view_model.dart';
import 'package:alyamamah/ui/views/chats/chats_view_state.dart';
import 'package:alyamamah/ui/widgets/empty_view.dart';
import 'package:alyamamah/ui/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsView extends ConsumerStatefulWidget {
  const ChatsView({super.key});

  @override
  ConsumerState<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends ConsumerState<ChatsView> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await ref.read(chatsViewModelProvider.notifier).getChats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatsViewState = ref.watch(chatsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.s.chats),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(chatsViewModelProvider.notifier).getChats();
        },
        child: switch (chatsViewState.status) {
          ChatsViewStatus.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          ChatsViewStatus.errorLoading => ErrorView(
              title: context.s.something_went_wrong_fetching_your_chats,
              subtitle: context.s.please_try_again,
            ),
          ChatsViewStatus.loaded when chatsViewState.chats.isEmpty => EmptyView(
              title: context.s.no_chats,
              subtitle: context.s.no_chats_description,
            ),
          ChatsViewStatus.loaded when chatsViewState.chats.isNotEmpty =>
            ListView.builder(
              itemCount: chatsViewState.chats.length,
              itemBuilder: (BuildContext context, int index) {
                final chat = chatsViewState.chats[index];

                return ListTile(
                  title: Text(chat.name ?? ''),
                  subtitle: Text(chat.lastMessage ?? ''),
                  onTap: () {},
                );
              },
            ),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}
