import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentIDScreen extends StatefulWidget {
  const StudentIDScreen({super.key});

  @override
  State<StudentIDScreen> createState() => _StudentIDScreenState();
}

class _StudentIDScreenState extends State<StudentIDScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
              Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      body: Center(
        child: Image.asset("assets/images/img.png"),
      ),
    );
  }
}
