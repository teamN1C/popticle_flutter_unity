import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:popticle_flutter_unity/core/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:popticle_flutter_unity/features/auth/login_screen.dart';
import 'package:popticle_flutter_unity/features/auth/signup_screen.dart';
import 'package:popticle_flutter_unity/features/home/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false,
      // 홈 페이지를 정의 (기본 경로)
      home: SplashScreen(),
      // 다른 경로들을 정의
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => const MyHomePage(playerName: "unknown"),
        // ... 기타 경로들
      },
    );
  }
}
