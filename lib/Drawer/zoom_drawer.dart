import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../TABS/Main Tab/maintab.dart';
import 'drawer_screen.dart';


class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});


  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
        menuScreenWidth: 390,
        angle: 0,
        mainScreenScale: 0.1,
        borderRadius: 40,
        menuScreen: DrawerScreen(),
        mainScreen: MainTabView()
    );
  }
}
