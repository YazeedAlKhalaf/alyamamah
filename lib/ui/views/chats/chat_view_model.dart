import 'package:alyamamah/ui/views/chats/chat_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatViewModelProvider =
    StateNotifierProvider<ChatViewModel, ChatViewState>(
  (ref) => ChatViewModel(),
);

class ChatViewModel extends StateNotifier<ChatViewState> {
  ChatViewModel() : super(ChatViewState());
}
