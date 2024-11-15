import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studentsphere/Logins/login%20page.dart';
import '../Classroom Tab/main_tab_a.dart';
import 'Tabs/announcement_page.dart';
import 'Tabs/homepage.dart';
import 'Tabs/menupage.dart';
import 'Tabs/notes.dart';
import 'Tabs/noticificationpage.dart';
import 'package:http/http.dart' as http;

class MainTabView extends StatefulWidget {
  final String userId;
  const MainTabView({super.key, required this.userId,});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {

  Future<void> logoutUser() async {
    final String apiUrl = 'http://192.168.1.36:3004/api/user/logout';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Logged out successfully');
        Get.offAll(() => LoginPage());
      } else {
        Get.snackbar('Error', 'Failed to log out');
      }
    } catch (error) {
      Get.snackbar('Error', 'An error occurred during logout');
    }
  }

  bool isClassroomSelected = false;
  late final List<Widget> tabs;
  int myIndex = 0;
  @override
  void initState() {
    super.initState();
    // Initialize the tabs list here to access widget.userId dynamically
    tabs = [
      HomePage(userId: widget.userId,),
      AnnouncementPage(),
      NotesPage(),
      Noticificationpage(),
      Menupage(userId: widget.userId,),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      openRatio: 0.69,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(microseconds: 1000),
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/profile_picture_demo.png',
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.select_all_rounded,
                    size: 25,
                    color: Colors.black45,
                  ),
                  title: Text(
                    (!isClassroomSelected) ? "Home" : "Classroom",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  trailing: PopupMenuButton(
                    color: Colors.black54,
                    iconColor: Colors.black54,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          onTap: (){
                            setState(() {
                              isClassroomSelected = false;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: (!isClassroomSelected) ? Colors.white : Colors.transparent,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Home",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ],
                          )
                      ),
                      PopupMenuItem(
                        onTap: (){
                          setState(() {
                            isClassroomSelected = true;
                          });
                        },
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: (isClassroomSelected) ? Colors.white : Colors.transparent,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Classroom",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.black45,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.black45,
                  ),
                  title: Text(
                    'Favorite',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black45,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    logoutUser();
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black45,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text(
                      'Terms of Service | Privacy Policy',
                      style: TextStyle(
                          color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: (!isClassroomSelected) ? Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: ClipOval(
                child: Image.asset(
                  "assets/images/profile_picture_demo.png",
                  height: 50,
                )
            ),
            onPressed: (){},
          ),
          title: Text(
            'STUDENT SPHERE',
            style: TextStyle(
                fontSize: 27, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.exit_to_app,
                  size: 30,
                  color: Colors.white,
                ))
          ],
        ),
        body: tabs[myIndex],
        bottomNavigationBar: BottomNavigationBar(
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
                  child: Icon(Icons.home),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.message),
                label: "Announcement"),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.note),
                label: "Notes"),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.notifications),
                label: "Notifications"),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.menu),
                label: "Menu"),
          ],
        ),
      ) : MainTabA()
    );
  }

// Method to create the Attendance card
}