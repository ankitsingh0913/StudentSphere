import 'package:flutter/material.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: ClipOval(
              child: Image.asset(
                "assets/images/ankit.jpg",
                height: 50,
              )
          ),
          onPressed: (){},
        ),
        title: Text(
          'Assignment',
          style: TextStyle(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/hamburger-menu.png",height: 25,color: Colors.white,),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/dots.png",height: 25,color: Colors.white,),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "No Pending Assignment",
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
              fontWeight: FontWeight.bold
            ),
        ),
      ),
    );
  }
}
