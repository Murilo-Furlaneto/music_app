// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({
    required this.message,
    this.statusCode,
  });
}

class GeneralException implements Exception {
  final String message;

  GeneralException({
    this.message = "Ocorreu um erro. Por favor, tente novamente.",
  });
}

class AudioPlayerException implements Exception {
  final String message;

  AudioPlayerException({required this.message});
}
