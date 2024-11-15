import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;// Import the jiffy package

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  List<dynamic> announcements = []; // List to store announcements

  @override
  void initState() {
    super.initState();
    fetchAnnouncement(); // Fetch announcements when the page is initialized
  }

  // Fetch announcements from the API
  Future<void> fetchAnnouncement() async {
    final String apiUrl = "http://192.168.1.36:3004/api/user/announcement/get";
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
      );

      print("Response Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          announcements = data['Announcements'] ?? []; // Ensure it's a list
        });
      } else {
        throw Exception('Failed to load announcements');
      }
    } catch (e) {
      print("Error fetching announcement: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Announcement',
              style: TextStyle(
                fontSize: 27,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // List view to display announcements
                  ListView.builder(
                    shrinkWrap: true, // Make the ListView take only needed space
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                    itemCount: announcements.length,
                    itemBuilder: (context, index) {
                      var announcement = announcements[index];
                      return Container(
                        margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue
                        ),
                        child: ListTile(
                          title: Text(
                            announcement['title'] ?? 'No title',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                              announcement['description'] ?? 'No description',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
