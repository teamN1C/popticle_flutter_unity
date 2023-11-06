import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class UnityDemoScreen extends StatefulWidget {
  final String playerName;
  const UnityDemoScreen({Key? key, required this.playerName}) : super(key: key);

  @override
  State<UnityDemoScreen> createState() => _UnityDemoScreenState();
}

class _UnityDemoScreenState extends State<UnityDemoScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController? _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: () async {
            // Pop the category page if Android back button is pressed.
            return true;
          },
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                child: UnityWidget(
                  onUnityCreated: onUnityCreated,
                  onUnityMessage: setPlayerName(
                    widget.playerName.toString(),
                  ),
                  useAndroidViewSurface: false,
                  fullscreen: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setPlayerName(String playerName) {
    print("$playerName setPlayerName!");
    Future.delayed(const Duration(seconds: 15), () {
      _unityWidgetController?.postMessage(
        'NameReceiveManager',
        'SetPlayerName',
        playerName,
      );
      print("$playerName sent!");
    });
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }
}
