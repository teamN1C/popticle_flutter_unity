import 'package:riverpod/riverpod.dart';
import 'package:popticle_flutter_unity/services/token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final tokenServiceProvider = Provider<TokenService>((ref) {
  final sharedPreferencesAsyncValue = ref.watch(sharedPreferencesProvider);

  return sharedPreferencesAsyncValue.when(
    data: (sharedPreferences) => TokenService(sharedPreferences),
    loading: () => TokenService(SharedPreferences.getInstance() as SharedPreferences), // Temporary fallback
    error: (e, stack) {
      print('Error loading SharedPreferences: $e');
      return TokenService(SharedPreferences.getInstance() as SharedPreferences); // Temporary fallback
    },
  );
});


