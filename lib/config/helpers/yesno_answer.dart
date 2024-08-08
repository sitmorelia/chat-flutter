import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoAnswer {
  final _dio = Dio();

  Future<Message> getYesNoAnswer() async {
    try {
      final response = await _dio.get('https://yesno.wtf/api');

      if (response.data != null &&
          response.data['answer'] != null &&
          response.data['image'] != null) {
        return Message(
          text: response.data['answer'],
          imageURL: response.data['image'],
          fromWho: FromWho.yours,
        );
      } else {
        throw Exception("Respuesta inválida del servidor.");
      }
    } catch (e) {
      // Manejar errores y devolver un mensaje de error o un mensaje por defecto
      return Message(
        text: 'No se pudo obtener la respuesta',
        imageURL: '', // Podrías poner una URL por defecto o dejarla vacía
        fromWho: FromWho.yours,
      );
    }
  }
}
