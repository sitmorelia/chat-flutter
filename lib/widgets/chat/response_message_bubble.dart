import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ResponseMessageBubble extends StatelessWidget {
  final Message message;
  const ResponseMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: colors.onSecondary),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _ImageBubble(imageURL: message.imageURL),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String? imageURL;
  const _ImageBubble({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageURL ?? 'https://via.placeholder.com/150',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
