import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
          textController.clear();
        },
      ),
    );

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      onTapOutside: (event) {
        focusNode.unfocus();
      },
    );
  }
}
