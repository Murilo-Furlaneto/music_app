import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvServices {
  DotEnvServices._();

  static String get getApiBaseUrl => dotenv.env["API_BASE_URL"] as String;
}
