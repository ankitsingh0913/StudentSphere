import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  Future<void> logoutUser() async {
    final String apiUrl = 'http://192.168.1.36:3004/api/user/logout';

    try {
      final response = await http.post(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Logged out successfully');
      } else {
        Get.snackbar('Error', 'Failed to log out');
      }
    } catch (error) {
      Get.snackbar('Error', 'An error occurred during logout');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xfff6f6f6),
                Color(0xffd5c28f), // Ending color
              ],
            )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xfff6f6f6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/images/flower.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                    fontSize: 27,
                                    color: Color(0xff6B0D52),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "emailId@gmai.com",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: const Color(0xff6B0D52).withOpacity(0.8),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 250,
                    // decoration: BoxDecoration(
                    //     color: Colors.white.withOpacity(0.2),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.3),
                    //         spreadRadius: 6,
                    //         blurRadius: 7,
                    //         offset: Offset(0, 3), // changes the position of the shadow
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.circular(6)
                    // ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.home_outlined,
                        size: 30,
                        color: Color(0xff981375),
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(
                            color: const Color(0xff981375).withOpacity(1),
                            fontWeight: FontWeight.w600,
                            fontSize: 25
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 250,
                    // decoration: BoxDecoration(
                    //     color: Colors.white.withOpacity(0.2),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.3),
                    //         spreadRadius: 6,
                    //         blurRadius: 7,
                    //         offset: Offset(0, 3), // changes the position of the shadow
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.circular(6)
                    // ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.dark_mode_outlined,
                        size: 30,
                        color: Color(0xff981375),
                      ),
                      title: Text(
                        "Theme",
                        style: TextStyle(
                            color: const Color(0xff981375).withOpacity(1),
                            fontWeight: FontWeight.w600,
                            fontSize: 25
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,),
                  child: Container(
                    width: 250,
                    // decoration: BoxDecoration(
                    //     color: Colors.white.withOpacity(0.2),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.3),
                    //         spreadRadius: 6,
                    //         blurRadius: 7,
                    //         offset: Offset(0, 3), // changes the position of the shadow
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.circular(6)
                    // ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.settings_outlined,
                        size: 30,
                        color: Color(0xff981375),
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(
                            color: const Color(0xff981375).withOpacity(1),
                            fontWeight: FontWeight.w600,
                            fontSize: 25
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,),
                  child: Container(
                    width: 250,
                    // decoration: BoxDecoration(
                    //     color: Colors.white.withOpacity(0.2),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.3),
                    //         spreadRadius: 6,
                    //         blurRadius: 7,
                    //         offset: Offset(0, 3), // changes the position of the shadow
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.circular(6)
                    // ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.privacy_tip_outlined,
                        size: 30,
                        color: Color(0xff981375),
                      ),
                      title: Text(
                        "Privacy ",
                        style: TextStyle(
                            color: const Color(0xff981375).withOpacity(1),
                            fontWeight: FontWeight.w600,
                            fontSize: 25
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 250,
                    // decoration: BoxDecoration(
                    //     color: Colors.white.withOpacity(0.2),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.3),
                    //         spreadRadius: 6,
                    //         blurRadius: 7,
                    //         offset: Offset(0, 3), // changes the position of the shadow
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.circular(6)
                    // ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.import_contacts,
                        size: 30,
                        color: Color(0xff981375),
                      ),
                      title: Text(
                        "About",
                        style: TextStyle(
                            color: const Color(0xff981375).withOpacity(1),
                            fontWeight: FontWeight.w600,
                            fontSize: 25
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffd5c28f),
                              spreadRadius: 6,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes the position of the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          size: 25,
                          color: Color(0xff981375),
                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(
                              color: const Color(0xff981375).withOpacity(1),
                              fontWeight: FontWeight.w600,
                              fontSize: 23
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

