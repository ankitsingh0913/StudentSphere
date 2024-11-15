import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
          'Chat',
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
    );
  }
}
