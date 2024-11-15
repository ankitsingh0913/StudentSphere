import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateProfileScreen extends StatefulWidget {
  final String userId;
  const UpdateProfileScreen({super.key, required this.userId});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController enrollNumberController = TextEditingController();

  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    final String apiUrl = "http://192.168.1.36:3004/api/user/${widget.userId}";

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          userData = data['user'];
          nameController.text = userData?['fullName'] ?? '';
          roleController.text = userData?['role'] ?? '';
          branchController.text = userData?['branch'] ?? '';
          classController.text = userData?['class'] ?? '';
          enrollNumberController.text = userData?['enrollmentNumber'] ?? '';
        });
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching profile: $e")),
      );
    }
  }

  Future<void> updateUserProfile() async {
    final String apiUrl = "http://192.168.1.36:3004/api/user/update/${widget.userId}";

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'fullName': nameController.text,
          'role': roleController.text,
          'branch': branchController.text,
          'class': classController.text,
          'enrollmentNumber': enrollNumberController.text
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully!")),
        );
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error updating profile: $e")),
      );
    }
  }

  void resetFields() {
    setState(() {
      nameController.text = userData?['fullName'] ?? '';
      roleController.text = userData?['role'] ?? '';
      branchController.text = userData?['branch'] ?? '';
      classController.text = userData?['class'] ?? '';
      enrollNumberController.text = userData?['enrollmentNumber'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      child: Image.asset(
                        "assets/images/cover_photo.png",
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[800],
                      radius: 70,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage:
                        AssetImage("assets/images/profile_picture_demo.png"),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: userData?['fullName']),
                    ),
                    TextFormField(
                      controller: roleController,
                      decoration: InputDecoration(hintText: userData?['role']),
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
                    TextFormField(
                      controller: branchController,
                      decoration: InputDecoration(hintText: userData?['branch']),
                    ),
                    TextFormField(
                      controller: classController,
                      decoration: InputDecoration(hintText: userData?['class']),
                    ),
                    TextFormField(
                      controller: enrollNumberController,
                      decoration: InputDecoration(hintText: userData?['enrollmentNumber']),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: resetFields,
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.black,
                      minimumSize: const Size(100, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: (){
                      updateUserProfile();
                      Get.back();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff001692),
                      minimumSize: const Size(100, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
