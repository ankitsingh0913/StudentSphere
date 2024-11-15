import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Models/lists.dart';
import '../Screens/profile_screen.dart';
import '../Screens/reminders_screen.dart';
import '../Screens/student_id_screen.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  final String userId;
  const HomePage({super.key, required this.userId,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? userData;
  String name = " ";

  @override
  void initState() {
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    final String apiUrl = 'http://192.168.1.36:3004/api/user/${widget.userId}';
    print(apiUrl.toString());
    print(widget.userId);
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        "Content-Type": "application/json",
        // Add your authorization token here if needed
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          userData = data['user'];
          name = userData?['fullName'];

        });
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      print("Error fetching profile: $e");
    }
  }

  final itemVM = Get.put(ItemlistsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      ZoomDrawer.of(context)?.toggle();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 35,
                      color: Colors.black54,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(
                      children: [
                        Text(
                          "Welcome " + name,
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Happy to help you!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 15),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: itemVM.ItemlistArr.length,
                  itemBuilder: (context, index) {
                    var mObj = itemVM.ItemlistArr[index];
                    return Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey[100],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: InkWell(
                        onTap: () {
                          var count = mObj["count"];

                          // Navigate to the appropriate screen based on the count
                          if (count == "1") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StudentIDScreen()),
                            );
                          } else if (count == "2") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfileScreen(userId: widget.userId))
                            );
                          } else if (count == "3") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RemindersScreen()),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Image.asset(
                                    mObj["image"],
                                    height: 45,
                                    width: 45,
                                    color: Colors.blue[900],
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                mObj["name"],
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 15,
                                  fontFamily: 'Schuyler',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTimetableCard(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildAttendanceCard(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildFeesCard(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildCgpaCard(0.356,(0.356 >= 0.75) ? Colors.green : Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTimetableCard() {
    return Card(
      color: Colors.blueGrey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Timetable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Thursday', style: TextStyle(color: Colors.grey[900])),
                Spacer(),
                Icon(Icons.calendar_today, color: Colors.grey[900], size: 20),
              ],
            ),
            SizedBox(height: 10),
            _buildClassTime(
              '8:00 AM - 9:00 AM',
              'Digital Logic Design',
            ),
            SizedBox(height: 10),
            _buildClassTime('9:30 AM - 10:30 AM', 'Assembly Language'),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCard() {
    return Card(
      color: Colors.blueGrey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Attendance',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            SizedBox(height: 10),
            _buildAttendanceProgress('Digital Logic Design', 0.74, Colors.red),
            SizedBox(height: 10),
            _buildAttendanceProgress('Assembly Language', 0.88, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildFeesCard() {
    return Card(
      color: Colors.blueGrey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fees',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Fees Due: '),
                Spacer(),
                Text('0 (INR)', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to create the CGPA card
  Widget _buildCgpaCard(double progress, Color color) {
    return Card(
      color: Colors.blueGrey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CGPA',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            SizedBox(height: 10),
            Center(
                child: Stack(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: CircularProgressIndicator(
                        value: progress, // Example value
                        strokeWidth: 7,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                      ),
                    ),
                    Positioned(
                      top: 11,
                      left: 13,
                      child: Text(
                          '${(progress * 10).toStringAsFixed(0)}%',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: (3.56 >= 7.5) ? Colors.green : Colors.red
                          )
                      ),
                    ),
                  ]
                )
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build class time rows
  Widget _buildClassTime(String time, String subject) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Text(time,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.grey[900])),
          SizedBox(width: 10),
          Text(subject,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Divider(
            color: Colors.black,
            thickness: 1,
            height: 1,
          )
        ],
      ),
    );
  }

  // Helper method to create attendance progress
  Widget _buildAttendanceProgress(String subject, double progress, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subject,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
          ),
          overflow: TextOverflow.ellipsis, // Prevents overflow by adding '...' to truncated text
        ),
        SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                value: progress, // Example value
                strokeWidth: 6,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Positioned(
              top: 13,
              left: 10,
              child: Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                  color: color,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ],
        )
      ]
    );
  }
}
