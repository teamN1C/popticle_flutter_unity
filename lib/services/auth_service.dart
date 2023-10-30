import 'api_service.dart';
import 'package:riverpod/riverpod.dart';

class AuthService {
  final ApiService apiService;

  AuthService(this.apiService);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final body = {'email': email, 'password': password};
    return await apiService.post('auth/login', body);
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    return await apiService.post('auth/register', data);
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    final body = {'refreshToken': refreshToken};
    return await apiService.post('auth/refresh-token', body);
  }
}
