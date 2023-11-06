import 'package:flutter/material.dart';
import 'package:popticle_flutter_unity/common/layouts/default_layout.dart';
import 'package:popticle_flutter_unity/common/const/colors.dart';
import 'package:popticle_flutter_unity/providers/token_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnToken();
  }

  _navigateBasedOnToken() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      final sharedPreferencesAsyncValue = ref.watch(sharedPreferencesProvider);
      if (sharedPreferencesAsyncValue is AsyncData) {
        final tokenService = ref.read(tokenServiceProvider);
        if (tokenService.hasValidToken() == true) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/login');
        }
      } else if (sharedPreferencesAsyncValue is AsyncError) {
        print('Error loading SharedPreferences: ${sharedPreferencesAsyncValue.error}');
        Navigator.pushReplacementNamed(context, '/login'); // Move to login screen on error
      } else if (sharedPreferencesAsyncValue is AsyncLoading) {
        print('SharedPreferences still loading');
        // You might want to handle this case differently, for now, moving to login as a fallback
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      print('Error in _navigateBasedOnToken: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 16.0),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
