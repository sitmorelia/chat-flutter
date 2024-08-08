import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/yesno_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'hola amor!', fromWho: FromWho.mine),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.mine),
  ];

  final chatScrollController = ScrollController();
  final yesnoAnswer = YesNoAnswer();

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messages.add(newMessage);

    if (text.endsWith('?')) await responseMessage();

    notifyListeners();
    moveScrollToEnd();
  }

  Future<void> responseMessage() async {
    final resMessage = await yesnoAnswer.getYesNoAnswer();
    messages.add(resMessage);

    notifyListeners();
    moveScrollToEnd();
  }

  void moveScrollToEnd() {
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}
