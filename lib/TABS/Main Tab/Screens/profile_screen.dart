import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:studentsphere/TABS/Main%20Tab/Screens/student_id_screen.dart';
import 'package:studentsphere/TABS/Main%20Tab/Screens/update_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  const ProfileScreen({super.key, required this.userId, });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData;
  String id=" ";

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async { // Access the DetailsController

      final String apiUrl = "http://192.168.1.36:3004/api/user/${widget.userId}";
      print("API URL: $apiUrl");

      try {
        final response = await http.get(Uri.parse(apiUrl), headers: {
          "Content-Type": "application/json",
        });

        print("Response Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            userData = data['user'];
            id = userData?['_id'];
          });
        } else {
          throw Exception('Failed to load user profile');
        }
      } catch (e) {
        print("Error fetching profile: $e");
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.grey[800],
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,MaterialPageRoute(builder: (context) => StudentIDScreen())
                        );
                      },
                      child: Image.asset(
                        "assets/images/cover_photo.png",
                        height: 200,
                        width: MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpdateProfileScreen(userId: widget.userId))
                      );
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Container(
                      color: Colors.grey[800],
                      height: 140,
                      width: 140,
                    ),
                  ),
                ),
                Positioned(
                  top: 155,
                  left: 25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Container(
                      color: Colors.grey,
                      height: 130,
                      width: 130,
                      child: InkWell(
                        onTap: (){
                          // Get.to(()=>ProfilePictureScreen());
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/profile_picture_demo.png"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData?['fullName'] ?? "Name",
                        style: TextStyle(
                          fontSize: 31,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userData?['role'] ?? "Engineering Student",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "GGSIPU",
                        style: TextStyle(
                          fontSize: 27,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Maharaja Surajmal Institute of Technology",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Branch",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.grey[300],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    userData?['branch'] ?? "Computer Science and Engineering",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.grey[300],
                              ),
                              child: Center(
                                child: Text(
                                  userData?['class'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Enrollment No.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.grey[300],
                        ),
                        child: Center(
                          child: Text(
                            userData?['enrollmentNumber'] ?? "04815002721",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
