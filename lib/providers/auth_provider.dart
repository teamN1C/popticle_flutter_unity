import 'package:riverpod/riverpod.dart';
import 'package:popticle_flutter_unity/services/auth_service.dart';
import 'package:popticle_flutter_unity/services/api_service.dart';



final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return AuthService(apiService);
});