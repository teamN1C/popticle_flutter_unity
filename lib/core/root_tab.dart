import 'package:popticle_flutter_unity/common/const/colors.dart';
import 'package:popticle_flutter_unity/common/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:popticle_flutter_unity/features/auth/login_screen.dart';
import 'package:popticle_flutter_unity/features/home/home_screen.dart';

class RootTab extends StatefulWidget {
  static String get routeName => 'home';

  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);

    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);

    super.dispose();
  }

  void tabListener(){
    setState((){
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'POPTICLE',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomeScreen(),      // 홈 화면 위젯
          // PopticleScreen(),  // Popticle 화면 위젯
          // MyPageScreen(),    // 마이페이지 화면 위젯
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BODY_TEXT_COLOR,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.camera),
      label: 'POPTICLE',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outlined),
      label: 'MYPAGE',
          ),
        ],
      ),
    );
  }
}
