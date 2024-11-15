import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studentsphere/Models/lists.dart';

class Noticificationpage extends StatefulWidget {
  const Noticificationpage({super.key});

  @override
  State<Noticificationpage> createState() => _NoticificationpageState();
}

class _NoticificationpageState extends State<Noticificationpage> {
  final itemVM = Get.put(ItemlistsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: itemVM.notification.length,
        itemBuilder: (context,index){
          var mObj = itemVM.notification[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes the position of the shadow
                ),
              ],
            ),
            margin: const EdgeInsets.only(left: 5,right: 5,top: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        mObj["image"],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mObj["message"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff6B0D52),
                        ),
                      ),
                      Text(
                        mObj["content"], // Add your subtitle text here
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600]
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
