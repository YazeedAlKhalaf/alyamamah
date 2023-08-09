import 'dart:async';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/ui/views/chats/chats_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

const String SORT_ASC = 'asc';
const String SORT_DESC = 'desc';

@RoutePage()
class ChatView extends ConsumerStatefulWidget {
  final CubeUser cubeUser;
  final CubeDialog chat;

  const ChatView({
    super.key,
    required this.cubeUser,
    required this.chat,
  });

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final _log = Logger('_ChatViewState');

  final _occupants = <int?, CubeUser?>{};

  late TextEditingController messageController;
  late ScrollController listScrollController;

  StreamSubscription<CubeMessage>? messagesSubscription;
  StreamSubscription<MessageStatus>? deliveredSubscription;
  StreamSubscription<MessageStatus>? readSubscription;
  StreamSubscription<TypingStatus>? typingSubscription;
  StreamSubscription<MessageReaction>? reactionsSubscription;

  final List<CubeMessage> _unreadMessages = [];
  final List<CubeMessage> _unsentMessages = [];

  static const int messagesPerPage = 50;
  int lastPartSize = 0;

  late bool isLoading;
  List<CubeMessage> listMessage = [];
  Timer? typingTimer;
  bool isTyping = false;
  String userStatus = '';
  static const int TYPING_TIMEOUT = 700;
  static const int STOP_TYPING_TIMEOUT = 2000;

  Schedule? schedule;

  @override
  void initState() {
    super.initState();
    _initCubeChat();

    isLoading = false;

    messageController = TextEditingController();
    listScrollController = ScrollController();

    final sectionSeq = widget.chat.name?.split('-')[1] ?? '';
    schedule = ref
        .read(chatsViewModelProvider)
        .schedules
        .firstWhereOrNull((schedule) => schedule.sectionSeq == sectionSeq);
  }

  @override
  void dispose() {
    messagesSubscription?.cancel();
    super.dispose();
  }

  void _initCubeChat() {
    _log.info('_initCubeChat');
    if (CubeChatConnection.instance.isAuthenticated()) {
      _log.info('[_initCubeChat] isAuthenticated');
      _initChatListeners();
    } else {
      _log.info('[_initCubeChat] not authenticated');
      CubeChatConnection.instance.connectionStateStream.listen((state) {
        _log.info('[_initCubeChat] state $state');
        if (CubeChatConnectionState.Ready == state) {
          _initChatListeners();

          if (_unreadMessages.isNotEmpty) {
            for (var cubeMessage in _unreadMessages) {
              widget.chat.readMessage(cubeMessage);
            }
            _unreadMessages.clear();
          }

          if (_unsentMessages.isNotEmpty) {
            for (var cubeMessage in _unsentMessages) {
              widget.chat.sendMessage(cubeMessage);
            }

            _unsentMessages.clear();
          }
        }
      });
    }
  }

  _initChatListeners() {
    log('[_initChatListeners]');
    messagesSubscription = CubeChatConnection
        .instance.chatMessagesManager!.chatMessagesStream
        .listen(onReceiveMessage);
    deliveredSubscription = CubeChatConnection
        .instance.messagesStatusesManager!.deliveredStream
        .listen(onDeliveredMessage);
    readSubscription = CubeChatConnection
        .instance.messagesStatusesManager!.readStream
        .listen(onReadMessage);
    typingSubscription = CubeChatConnection
        .instance.typingStatusesManager!.isTypingStream
        .listen(onTypingMessage);
    reactionsSubscription = CubeChatConnection
        .instance.messagesReactionsManager?.reactionsStream
        .listen(onReactionReceived);
  }

  void onReceiveMessage(CubeMessage message) {
    _log.info('onReceiveMessage message= $message');
    if (message.dialogId != widget.chat.dialogId) return;

    addMessageToListView(message);
  }

  void onDeliveredMessage(MessageStatus status) {
    _log.info('onDeliveredMessage message= $status');
    updateReadDeliveredStatusMessage(status, false);
  }

  void onReadMessage(MessageStatus status) {
    _log.info('onReadMessage message= ${status.messageId}');
    updateReadDeliveredStatusMessage(status, true);
  }

  void onReactionReceived(MessageReaction reaction) {
    _log.info('onReactionReceived message= ${reaction.messageId}');
    _updateMessageReactions(reaction);
  }

  void onTypingMessage(TypingStatus status) {
    log('TypingStatus message= ${status.userId}');
    if (status.userId == widget.cubeUser.id ||
        (status.dialogId != null && status.dialogId != widget.chat.dialogId)) {
      return;
    }
    userStatus = _occupants[status.userId]?.fullName ??
        _occupants[status.userId]?.login ??
        _occupants[status.userId]?.email ??
        '';
    if (userStatus.isEmpty) return;
    userStatus = '$userStatus is typing ...';

    if (isTyping != true) {
      setState(() {
        isTyping = true;
      });
    }
    startTypingTimer();
  }

  startTypingTimer() {
    typingTimer?.cancel();
    typingTimer = Timer(const Duration(milliseconds: 900), () {
      setState(() {
        isTyping = false;
      });
    });
  }

  addMessageToListView(CubeMessage message) {
    setState(() {
      isLoading = false;
      int existMessageIndex = listMessage.indexWhere((cubeMessage) {
        return cubeMessage.messageId == message.messageId;
      });

      if (existMessageIndex != -1) {
        listMessage[existMessageIndex] = message;
      } else {
        listMessage.insert(0, message);
      }
    });
  }

  updateReadDeliveredStatusMessage(MessageStatus status, bool isRead) {
    _log.info('[updateReadDeliveredStatusMessage]');
    setState(() {
      CubeMessage? msg = listMessage
          .firstWhereOrNull((msg) => msg.messageId == status.messageId);
      if (msg == null) return;
      if (isRead) {
        msg.readIds == null
            ? msg.readIds = [status.userId]
            : msg.readIds?.add(status.userId);
      } else {
        msg.deliveredIds == null
            ? msg.deliveredIds = [status.userId]
            : msg.deliveredIds?.add(status.userId);
      }

      _log.info('[updateReadDeliveredStatusMessage] status updated for $msg');
    });
  }

  void _updateMessageReactions(MessageReaction reaction) {
    log('[_updateMessageReactions]');
    setState(() {
      CubeMessage? msg = listMessage
          .firstWhereOrNull((msg) => msg.messageId == reaction.messageId);
      if (msg == null) return;

      if (msg.reactions == null) {
        msg.reactions = CubeMessageReactions.fromJson({
          'own': {
            if (reaction.userId == widget.cubeUser.id) reaction.addReaction
          },
          'total': {reaction.addReaction: 1}
        });
      } else {
        if (reaction.addReaction != null) {
          if (reaction.userId != widget.cubeUser.id ||
              !(msg.reactions?.own.contains(reaction.addReaction) ?? false)) {
            if (reaction.userId == widget.cubeUser.id) {
              msg.reactions!.own.add(reaction.addReaction!);
            }

            msg.reactions!.total[reaction.addReaction!] =
                msg.reactions!.total[reaction.addReaction] == null
                    ? 1
                    : msg.reactions!.total[reaction.addReaction]! + 1;
          }
        }

        if (reaction.removeReaction != null) {
          if (reaction.userId != widget.cubeUser.id ||
              (msg.reactions?.own.contains(reaction.removeReaction) ?? false)) {
            if (reaction.userId == widget.cubeUser.id) {
              msg.reactions!.own.remove(reaction.removeReaction!);
            }

            msg.reactions!.total[reaction.removeReaction!] =
                msg.reactions!.total[reaction.removeReaction] != null &&
                        msg.reactions!.total[reaction.removeReaction]! > 0
                    ? msg.reactions!.total[reaction.removeReaction]! - 1
                    : 0;
          }

          msg.reactions!.total.removeWhere((key, value) => value == 0);
        }
      }
    });
  }

  void onSendChatMessage(String content) {
    if (content.trim() != '') {
      final message = createCubeMsg();
      message.body = content.trim();
      onSendMessage(message);
    }
  }

  CubeMessage createCubeMsg() {
    var message = CubeMessage();
    message.dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    message.markable = true;
    message.saveToHistory = true;
    return message;
  }

  void onSendMessage(CubeMessage message) async {
    log('onSendMessage message= $message');
    messageController.clear();
    await widget.chat.sendMessage(message);
    message.senderId = widget.cubeUser.id;
    addMessageToListView(message);
    listScrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
    // TODO: probably not needed
    // if (widget.chat.type == CubeDialogType.PRIVATE) {
    //   ChatManager.instance.sentMessagesController
    //       .add(message..dialogId = widget.chat.dialogId);
    // }
  }

  Widget buildListMessage() {
    getWidgetMessages(listMessage) {
      return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) => buildItem(index, listMessage[index]),
        itemCount: listMessage.length,
        reverse: true,
        controller: listScrollController,
      );
    }

    return Flexible(
      child: StreamBuilder<List<CubeMessage>>(
        stream: getMessagesList().asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        context.colorScheme.primary)));
          } else {
            listMessage = snapshot.data ?? [];
            return getWidgetMessages(listMessage);
          }
        },
      ),
    );
  }

  Future<List<CubeMessage>> getMessagesList() async {
    if (listMessage.isNotEmpty) return Future.value(listMessage);

    Completer<List<CubeMessage>> completer = Completer();
    List<CubeMessage>? messages;
    try {
      await Future.wait<void>([
        getMessagesByDate(0, false).then((loadedMessages) {
          isLoading = false;
          messages = loadedMessages;
        }),
        getAllUsersByIds(widget.chat.occupantsIds!.toSet()).then((result) =>
            _occupants.addAll({for (var item in result!.items) item.id: item}))
      ]);
      completer.complete(messages);
    } catch (error) {
      completer.completeError(error);
    }
    return completer.future;
  }

  Widget buildItem(int index, CubeMessage message) {
    markAsReadIfNeed() {
      var isOpponentMsgRead = message.readIds != null &&
          message.readIds!.contains(widget.cubeUser.id);
      print(
          'markAsReadIfNeed message= $message, isOpponentMsgRead= $isOpponentMsgRead');
      if (message.senderId != widget.cubeUser.id && !isOpponentMsgRead) {
        if (message.readIds == null) {
          message.readIds = [widget.cubeUser.id!];
        } else {
          message.readIds!.add(widget.cubeUser.id!);
        }

        if (CubeChatConnection.instance.chatConnectionState ==
            CubeChatConnectionState.Ready) {
          widget.chat.readMessage(message);
        } else {
          _unreadMessages.add(message);
        }

        ChatManager.instance.readMessagesController.add(MessageStatus(
          widget.cubeUser.id!,
          message.messageId!,
          widget.chat.dialogId!,
        ));
      }
    }

    Widget getReadDeliveredWidget() {
      log('[getReadDeliveredWidget]');
      bool messageIsRead() {
        log('[getReadDeliveredWidget] messageIsRead');
        if (widget.chat.type == CubeDialogType.PRIVATE) {
          return message.readIds != null &&
              (message.recipientId == null ||
                  message.readIds!.contains(message.recipientId));
        }
        return message.readIds != null &&
            message.readIds!.any((int id) =>
                id != widget.cubeUser.id && _occupants.keys.contains(id));
      }

      bool messageIsDelivered() {
        log('[getReadDeliveredWidget] messageIsDelivered');
        if (widget.chat.type == CubeDialogType.PRIVATE) {
          return message.deliveredIds != null &&
              (message.recipientId == null ||
                  message.deliveredIds!.contains(message.recipientId));
        }
        return message.deliveredIds != null &&
            message.deliveredIds!.any((int id) =>
                id != widget.cubeUser.id && _occupants.keys.contains(id));
      }

      if (messageIsRead()) {
        log('[getReadDeliveredWidget] if messageIsRead');
        return getMessageStateWidget(MessageState.read);
      } else if (messageIsDelivered()) {
        log('[getReadDeliveredWidget] if messageIsDelivered');
        return getMessageStateWidget(MessageState.delivered);
      } else {
        log('[getReadDeliveredWidget] sent');
        return getMessageStateWidget(MessageState.sent);
      }
    }

    Widget getDateWidget() {
      return Text(
        DateFormat('HH:mm').format(
            DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)),
        style: TextStyle(
          color: context.colorScheme.secondary,
          fontSize: 12.0,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    Widget getHeaderDateWidget() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10.0),
        child: Text(
          DateFormat('dd MMMM').format(
              DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)),
          style: TextStyle(
              color: context.colorScheme.primary,
              fontSize: 20.0,
              fontStyle: FontStyle.italic),
        ),
      );
    }

    bool isHeaderView() {
      int headerId = int.parse(DateFormat('ddMMyyyy').format(
          DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)));
      if (index >= listMessage.length - 1) {
        return false;
      }
      var msgPrev = listMessage[index + 1];
      int nextItemHeaderId = int.parse(DateFormat('ddMMyyyy').format(
          DateTime.fromMillisecondsSinceEpoch(msgPrev.dateSent! * 1000)));
      var result = headerId != nextItemHeaderId;
      return result;
    }

    if (message.senderId == widget.cubeUser.id) {
      // Right (own message)
      return Column(
        children: <Widget>[
          isHeaderView() ? getHeaderDateWidget() : const SizedBox.shrink(),
          GestureDetector(
            onLongPress: () => _reactOnMessage(message),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                      right: 4.0),
                  child: GestureDetector(
                    onTap: () => _reactOnMessage(message),
                    child: const Icon(Icons.add_reaction_outlined,
                        size: 16, color: Colors.grey),
                  ),
                ),
                message.attachments?.isNotEmpty ?? false
                    // Image
                    ? Container(
                        margin: EdgeInsets.only(
                          bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                          right: 10.0,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // TODO: check this
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => FullPhoto(
                                  //       url: message.attachments!.first.url!,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: const ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                  // TODO: check this
                                  // child: CachedNetworkImage(
                                  //   placeholder: (context, url) => Container(
                                  //     width: 200.0,
                                  //     height: 200.0,
                                  //     padding: const EdgeInsets.all(70.0),
                                  //     decoration: BoxDecoration(
                                  //       color: context.colorScheme.secondary,
                                  //       borderRadius: const BorderRadius.all(
                                  //         Radius.circular(8.0),
                                  //       ),
                                  //     ),
                                  //     child: CircularProgressIndicator(
                                  //       valueColor:
                                  //           AlwaysStoppedAnimation<Color>(
                                  //         context.colorScheme.primary,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   errorWidget: (context, url, error) =>
                                  //       Material(
                                  //     borderRadius: const BorderRadius.all(
                                  //       Radius.circular(8.0),
                                  //     ),
                                  //     clipBehavior: Clip.hardEdge,
                                  //     child: Image.asset(
                                  //       'images/img_not_available.jpeg',
                                  //       width: 200.0,
                                  //       height: 200.0,
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //   ),
                                  //   imageUrl: message.attachments!.first.url!,
                                  //   width: 200.0,
                                  //   height: 200.0,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              if (message.reactions != null &&
                                  message.reactions!.total.isNotEmpty)
                                getReactionsWidget(message),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  getDateWidget(),
                                  getReadDeliveredWidget(),
                                ],
                              ),
                            ]),
                      )
                    : message.body != null && message.body!.isNotEmpty
                        // Text
                        ? Flexible(
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 480),
                              padding: const EdgeInsets.fromLTRB(
                                15.0,
                                10.0,
                                15.0,
                                10.0,
                              ),
                              decoration: BoxDecoration(
                                  color: context.colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(8.0)),
                              margin: EdgeInsets.only(
                                  bottom:
                                      isLastMessageRight(index) ? 20.0 : 10.0,
                                  right: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      message.body!,
                                      style: TextStyle(
                                          color: context.colorScheme.primary),
                                    ),
                                    if (message.reactions != null &&
                                        message.reactions!.total.isNotEmpty)
                                      getReactionsWidget(message),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        getDateWidget(),
                                        getReadDeliveredWidget(),
                                      ],
                                    ),
                                  ]),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 10.0, 15.0, 10.0),
                            width: 200.0,
                            decoration: BoxDecoration(
                                color: context.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8.0)),
                            margin: EdgeInsets.only(
                                bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                                right: 10.0),
                            child: Text(
                              'Empty',
                              style:
                                  TextStyle(color: context.colorScheme.primary),
                            ),
                          ),
              ],
            ),
          ),
        ],
      );
    } else {
      // Left (opponent message)
      markAsReadIfNeed();
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isHeaderView() ? getHeaderDateWidget() : const SizedBox.shrink(),
            GestureDetector(
              onLongPress: () => _reactOnMessage(message),
              child: Row(
                children: <Widget>[
                  // TODO: use avatar
                  const CircleAvatar(
                    radius: 15,
                  ),
                  message.attachments?.isNotEmpty ?? false
                      ? Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // TODO: check this
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => FullPhoto(
                                    //       url: message.attachments!.first.url!,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  child: const ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    // TODO: check this
                                    // child: CachedNetworkImage(
                                    //   placeholder: (context, url) => Container(
                                    //     width: 200.0,
                                    //     height: 200.0,
                                    //     padding: const EdgeInsets.all(70.0),
                                    //     decoration: BoxDecoration(
                                    //       color: context.colorScheme.secondary,
                                    //       borderRadius: const BorderRadius.all(
                                    //         Radius.circular(8.0),
                                    //       ),
                                    //     ),
                                    //     child: CircularProgressIndicator(
                                    //       valueColor:
                                    //           AlwaysStoppedAnimation<Color>(
                                    //         context.colorScheme.primary,
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   errorWidget: (context, url, error) =>
                                    //       const Material(
                                    //     borderRadius: BorderRadius.all(
                                    //       Radius.circular(8.0),
                                    //     ),
                                    //     clipBehavior: Clip.hardEdge,
                                    //     child: Icon(
                                    //       Icons.image_not_supported_rounded,
                                    //     ),
                                    //     // TODO: check this
                                    //     // child: Image.asset(
                                    //     //   'images/img_not_available.jpeg',
                                    //     //   width: 200.0,
                                    //     //   height: 200.0,
                                    //     //   fit: BoxFit.cover,
                                    //     // ),
                                    //   ),
                                    //   imageUrl: message.attachments!.first.url!,
                                    //   width: 200.0,
                                    //   height: 200.0,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ),
                                if (message.reactions != null &&
                                    message.reactions!.total.isNotEmpty)
                                  getReactionsWidget(message),
                                getDateWidget(),
                              ]),
                        )
                      : message.body != null && message.body!.isNotEmpty
                          ? Flexible(
                              child: Container(
                                constraints: const BoxConstraints(
                                    minWidth: 0.0, maxWidth: 480),
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 10.0, 15.0, 10.0),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                margin: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        message.body!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      if (message.reactions != null &&
                                          message.reactions!.total.isNotEmpty)
                                        getReactionsWidget(message),
                                      getDateWidget(),
                                    ]),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 10.0, 15.0, 10.0),
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: context.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              margin: EdgeInsets.only(
                                  bottom:
                                      isLastMessageRight(index) ? 20.0 : 10.0,
                                  right: 10.0),
                              child: Text(
                                'Empty',
                                style: TextStyle(
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ),
                  Padding(
                    padding: const EdgeInsets.only(
                      // bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                      left: 4.0,
                    ),
                    child: GestureDetector(
                      onTap: () => _reactOnMessage(message),
                      child: Icon(
                        Icons.add_reaction_outlined,
                        size: 16,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  bool isLastMessageLeft(int index) {
    if ((index > 0 && listMessage[index - 1].id == widget.cubeUser.id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 && listMessage[index - 1].id != widget.cubeUser.id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  getReactionsWidget(CubeMessage message) {
    if (message.reactions == null) return Container();

    var isOwnMessage = message.senderId == widget.cubeUser.id;

    return LayoutBuilder(builder: (context, constraints) {
      var widgetWidth =
          constraints.maxWidth == double.infinity ? 240 : constraints.maxWidth;
      var maxColumns = (widgetWidth / 60).round();
      if (message.reactions!.total.length < maxColumns) {
        maxColumns = message.reactions!.total.length;
      }

      return SizedBox(
        width: maxColumns * 56,
        child: GridView.count(
          primary: false,
          crossAxisCount: maxColumns,
          mainAxisSpacing: 4,
          childAspectRatio: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 4),
          children: <Widget>[
            ...message.reactions!.total.keys.map((reaction) {
              return GestureDetector(
                onTap: () => _performReaction(Emoji(reaction, ''), message),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: isOwnMessage ? 4 : 0,
                    right: isOwnMessage ? 0 : 4,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      color: message.reactions!.own.contains(reaction)
                          ? Colors.green
                          : Colors.grey,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            reaction,
                            style: kIsWeb
                                ? const TextStyle(
                                    color: Colors.green,
                                    fontFamily: 'NotoColorEmoji')
                                : null,
                          ),
                          Text(
                            ' ${message.reactions!.total[reaction].toString()}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList()
          ],
        ),
      );
    });
  }

  _reactOnMessage(CubeMessage message) {
    showDialog<Emoji>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  width: 400,
                  height: 400,
                  child: EmojiPicker(
                    config: const Config(
                      emojiTextStyle: kIsWeb
                          ? TextStyle(
                              color: Colors.green,
                              fontFamily: 'NotoColorEmoji',
                            )
                          : null,
                      iconColorSelected: Colors.green,
                      indicatorColor: Colors.green,
                      bgColor: Colors.white,
                    ),
                    onEmojiSelected: (category, emoji) {
                      Navigator.pop(context, emoji);
                    },
                  )));
        }).then((emoji) {
      log('onEmojiSelected emoji: ${emoji?.emoji}');
      if (emoji != null) {
        _performReaction(emoji, message);
      }
    });
  }

  void _performReaction(Emoji emoji, CubeMessage message) {
    if ((message.reactions?.own.isNotEmpty ?? false) &&
        (message.reactions?.own.contains(emoji.emoji) ?? false)) {
      removeMessageReaction(message.messageId!, emoji.emoji);
      _updateMessageReactions(MessageReaction(
          widget.cubeUser.id!, widget.chat.dialogId!, message.messageId!,
          removeReaction: emoji.emoji));
    } else {
      addMessageReaction(message.messageId!, emoji.emoji);
      _updateMessageReactions(MessageReaction(
          widget.cubeUser.id!, widget.chat.dialogId!, message.messageId!,
          addReaction: emoji.emoji));
    }
  }

  Widget getMessageStateWidget(MessageState? state) {
    Widget result;

    switch (state) {
      case MessageState.read:
        result = const Stack(children: <Widget>[
          Icon(
            Icons.check_rounded,
            size: 15.0,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 4,
            ),
            child: Icon(
              Icons.check_rounded,
              size: 15.0,
              color: Colors.green,
            ),
          )
        ]);

        break;
      case MessageState.delivered:
        result = Stack(children: <Widget>[
          Icon(
            Icons.check_rounded,
            size: 15.0,
            color: context.colorScheme.secondary,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Icon(
              Icons.check_rounded,
              size: 15.0,
              color: context.colorScheme.secondary,
            ),
          )
        ]);

        break;
      case MessageState.sent:
        result = Icon(
          Icons.check_rounded,
          size: 15.0,
          color: context.colorScheme.secondary,
        );

        break;
      default:
        result = const SizedBox.shrink();

        break;
    }

    return result;
  }

  Future<List<CubeMessage>> getMessagesByDate(int date, bool isLoadNew) async {
    var params = GetMessagesParameters();
    params.sorter = RequestSorter(SORT_DESC, '', 'date_sent');
    params.limit = messagesPerPage;
    params.filters = [
      RequestFilter('', 'date_sent', isLoadNew || date == 0 ? 'gt' : 'lt', date)
    ];

    return getMessages(widget.chat.dialogId!, params.getRequestParameters())
        .then((result) {
          lastPartSize = result!.items.length;

          return result.items;
        })
        .whenComplete(() {})
        .catchError((onError) {
          return List<CubeMessage>.empty(growable: true);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(schedule?.courseCode ?? ''),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Text('Chat Bubbles'),
          ),
          Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.padding,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: Constants.spacing),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoTextField(
                          controller: messageController,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.colorScheme.onSecondaryContainer,
                            ),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          placeholder: context.s.type_your_message_here,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(width: Constants.spacing),
                      IconButton(
                        icon: const Icon(Icons.send_rounded),
                        onPressed: () => onSendChatMessage(
                          messageController.text,
                        ),
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

class ChatManager {
  static ChatManager? _instance;

  ChatManager._();

  static ChatManager get instance => _instance ??= ChatManager._();

  StreamController<CubeMessage> sentMessagesController =
      StreamController.broadcast();

  Stream<CubeMessage> get sentMessagesStream {
    return sentMessagesController.stream;
  }

  StreamController<MessageStatus> readMessagesController =
      StreamController.broadcast();

  Stream<MessageStatus> get readMessagesStream {
    return readMessagesController.stream;
  }
}
