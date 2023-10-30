import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:popticle_flutter_unity/common/layouts/default_layout.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: "Home",  // DefaultLayout의 title에 "Home" 설정
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to POPTICLE :D',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[200]),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add some functionality or navigate to another screen
              },
              child: Text('Explore Features'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                // Handle navigation to messages page
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // Handle navigation to profile page
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle navigation to settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}
