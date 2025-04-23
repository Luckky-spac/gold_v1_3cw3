import 'package:dio/dio.dart';

class AuthService {
  Dio dio = Dio();
  Future<dynamic> register({
    required String username,
    required String userpassword,
    required String pinUser,
  }) async {
    try {
      final response = await dio.post(
        'http://localhost:2020/auth/register',
        data: {
          'user_name': username,
          'user_password': userpassword,
          'pin_user': pinUser,
        },
      );
      print(response.data);
      return response.data; // <-- important
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
