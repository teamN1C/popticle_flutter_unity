import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:popticle_flutter_unity/providers/auth_provider.dart';
import 'package:popticle_flutter_unity/providers/token_provider.dart';
import 'package:popticle_flutter_unity/common/layouts/default_layout.dart';

class SignupScreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    return DefaultLayout(
      title: "Sign Up", // DefaultLayout의 title 속성에 "Sign Up"을 전달
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await authService.register({
                    'name': nameController.text,
                    'email': emailController.text,
                    'password': passwordController.text,
                  });

                  if (result.containsKey("msg") && result["msg"] == "User created with success") {
                    if (result["access_token"] != null && result["refresh_token"] != null) {
                      final tokenService = ref.read(tokenServiceProvider);
                      await tokenService.saveAccessToken(result["access_token"]);
                      await tokenService.saveRefreshToken(result["refresh_token"]);

                      // Debug log for successful token save
                      print("Tokens saved successfully!");

                      Navigator.of(context).pushNamed("/home");
                    } else {
                      print("Tokens are missing in the response!");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Registration succeeded but tokens are missing!")),
                      );
                    }
                  } else {
                    // Handle registration error
                    print("Registration failed with result: $result");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Registration failed!")),
                    );
                  }
                } catch (e) {
                  print('Error during registration: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              },

              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
