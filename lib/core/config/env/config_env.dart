import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigEnv {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
}
