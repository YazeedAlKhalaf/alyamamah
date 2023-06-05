import 'package:alyamamah/core/extensions/gpt_message_sender.dart';
import 'package:alyamamah/core/models/optional.dart';
import 'package:alyamamah/core/services/yu_api/models/chat.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:alyamamah/ui/views/yu_gpt/models/gpt_message.dart';
import 'package:alyamamah/ui/views/yu_gpt/models/gpt_message_sender.dart';
import 'package:alyamamah/ui/views/yu_gpt/yu_gpt_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final yuGptViewModelProvider =
    StateNotifierProvider<YuGptViewModel, YuGptState>(
  (ref) => YuGptViewModel(
    yuApiService: ref.read(yuApiServiceProvider),
  ),
);

class YuGptViewModel extends StateNotifier<YuGptState> {
  final Logger _log = Logger('YuGptViewModel');

  final YuApiService _yuApiService;

  YuGptViewModel({
    required YuApiService yuApiService,
  })  : _yuApiService = yuApiService,
        super(YuGptState());

  Future<void> sendMessage(String message) async {
    try {
      state = state.copyWith(
        isGenerating: true,
        errorType: Optional(null),
        messages: [
          ...state.messages,
          GptMessage(
            sender: GptMessageSender.human,
            message: message,
          ),
          const GptMessage(
            sender: GptMessageSender.ai,
            message: '',
          ),
        ],
      );

      final chatStream = _yuApiService.chat(
        chats: [
          ...state.messages.map((e) {
            return Chat(
              role: e.sender.mapToChatRole(),
              text: e.message,
            );
          }).toList(),
        ],
      );

      chatStream.listen(
        (String token) {
          final lastMessage = state.messages.last;
          final messagesCopy = state.messages;
          messagesCopy.removeLast();

          state = state.copyWith(
            messages: [
              ...messagesCopy,
              lastMessage.copyWith(
                message: lastMessage.message + token,
              ),
            ],
          );
        },
        onError: (e) {
          if (e is YuApiServiceException) {
            _log.severe('error listening to the tokens stream: $e');

            state = state.copyWith(
              messages: state.messages..removeLast(),
              errorType: Optional(e.type),
            );
          }
        },
        onDone: () {
          _log.info('done listening to the tokens stream');
          state = state.copyWith(
            isGenerating: false,
          );
        },
      );
    } on YuApiServiceException catch (e) {
      _log.severe('error receiving the message: $e');

      state = state.copyWith(
        isGenerating: false,
        messages: state.messages..removeLast(),
        errorType: Optional(e.type),
      );
    }
  }

  void clearMessages() {
    state = state.copyWith(
      errorType: Optional(null),
      messages: const [],
    );
  }
}
