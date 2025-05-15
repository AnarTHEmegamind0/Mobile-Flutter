
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/globalProvider.dart';

class Jwtservice {
  final String token;
  Jwtservice(this.token);
  
  BuildContext? get context => null;

  // Future<String?>? get userId => null;

  Future<int?> getToken(String token) async {
    
    final storage = FlutterSecureStorage();
    await storage.write(key: "token", value: token);

    // Decode the token
    try {
      // final Map<String, dynamic> decodedToken = await JWT.decode(token);
      final jwt = JWT.decode(token);

      final userId = await getUserId(jwt.payload);

      return userId;
    } catch (e) {
      print('Error decoding token: $e');
    }
    return null;
  }

  Future<int?> getUserId(Map<String, dynamic> payload) async {
    print('Payload: ${payload['sub']}');
    int userId = payload['sub'];


    return userId;
  }

  Future<void> deleteToken() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: "token");
  }
}
