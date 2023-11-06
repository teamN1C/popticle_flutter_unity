// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'unity_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  final String playerName;

  const MyHomePage({Key? key, required this.playerName}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Here, you implement the widget structure for your home screen
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.pink.shade100,
                ),
              ),
              onPressed: () {
                requestCameraPermission(widget.playerName.toString());
              },
              child: Text(
                "launch the popticle right now!",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  requestCameraPermission(String playerName) async {
    /// status can either be: granted, denied, restricted or permanentlyDenied
    var status = await Permission.camera.status;

    if (status.isGranted) {
      print("$playerName + Permission is granted");
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UnityDemoScreen(playerName: playerName),
        ),
      );
    } else if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      if (await Permission.camera.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UnityDemoScreen(playerName: playerName),
          ),
        );
        print("$playerName + Permission was granted");
      }
    }
  }
}
