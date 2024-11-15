import 'package:flutter/material.dart';
import 'TabsA/activity.dart';
import 'TabsA/assignment.dart';
import 'TabsA/calender.dart';
import 'TabsA/chat.dart';
import 'TabsA/classes.dart';
import 'TabsA/more.dart';

class MainTabA extends StatefulWidget {
  const MainTabA({super.key});

  @override
  State<MainTabA> createState() => _MainTabAState();
}

class _MainTabAState extends State<MainTabA> {
  final tabs = const [
    Calender(),
    Activity(),
    Chat(),
    Assignment(),
    Classes(),
    More()
  ];
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          fill: 1,
        ),
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 15,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: InkWell(
                child: Icon(Icons.calendar_month),
              ),
              label: "Calender"),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.notifications_outlined),
              label: "Activity"),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.chat_outlined),
              label: "Chat"),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.assignment_outlined),
              label: "Assignment"),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.group_outlined),
              label: "Classes"
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.more_horiz),
              label: "More"
          ),
        ],
      ),
    );
  }
}
