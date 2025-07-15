import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> setSecureStorage() async {
  final storage = FlutterSecureStorage();
  await storage.write(key: 'API_KEY', value: String.fromEnvironment('API_KEY'));
  String? apiKey = await storage.read(key: 'API_KEY');
  if (apiKey != null) {
    print('API Key stored securely: $apiKey');
  } else {
    print('Failed to store API Key securely.');
  }
}
