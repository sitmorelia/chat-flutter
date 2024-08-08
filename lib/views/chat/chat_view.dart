import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/providers/chat/chat_provider.dart';
import 'package:yes_no_app/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/widgets/chat/response_message_bubble.dart';
import 'package:yes_no_app/widgets/global/message_field_box.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
              padding: EdgeInsets.all(6),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://64.media.tumblr.com/avatar_6c56378a721c_128.pnj'))),
          title: const Text('Chat con usuario'),
          centerTitle: false,
        ),
        body: _ChatMessages());
  }
}

class _ChatMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages[index];

                    return message.fromWho == FromWho.yours
                        ? ResponseMessageBubble(message: message)
                        : MyMessageBubble(
                            message: message,
                          );
                  })),
          MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value))
        ]),
      ),
    );
  }
}
