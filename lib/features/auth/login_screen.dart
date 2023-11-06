import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:popticle_flutter_unity/providers/auth_provider.dart';
import 'package:popticle_flutter_unity/providers/token_provider.dart';
import 'package:popticle_flutter_unity/common/const/colors.dart';
import 'package:popticle_flutter_unity/common/layouts/default_layout.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String get routeName => 'login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = ref.watch(authServiceProvider);
    final tokenService = ref.watch(tokenServiceProvider);

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(),
                const SizedBox(height: 16.0),
                _SubTitle(),
                Image.asset(
                  'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: '이메일을 입력해주세요.',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력해주세요.',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    final result = await authService.login(
                        _emailController.text, _passwordController.text);
                    if (result.containsKey("access_token")) {
                      tokenService.saveAccessToken(result["access_token"]);
                      tokenService.saveRefreshToken(result["refresh_token"]);
                      final userName = result["name"] ?? "unknown";
                      final userEmail = result["email"] ?? "";
                      Navigator.of(context).pushReplacementNamed("/home", arguments: {
                        'name': userName,
                        'email': userEmail,
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("로그인 실패!")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.pinkAccent,
                  ),
                  child: Text('로그인'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text('회원가입'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '환영합니다!',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.pink[100],
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\nPlay with POPTICLE :)',
      style: TextStyle(
        fontSize: 18,  // 크기 증가
        fontWeight: FontWeight.bold,  // 굵게
        color: Colors.pink[100],  // 분홍색 적용
      ),
    );
  }
}

