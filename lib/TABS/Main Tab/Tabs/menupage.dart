import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studentsphere/TABS/Main%20Tab/Screens/fee_screen.dart';
import '../../../Models/lists.dart';
import '../Screens/profile_screen.dart';
import 'announcement_page.dart';
import '../maintab.dart';
import 'package:http/http.dart' as http;

class Menupage extends StatefulWidget {
  final String userId;
  const Menupage({super.key, required this.userId});

  @override
  State<Menupage> createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {

  final itemVM = Get.put(ItemlistsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GridView.builder(
                itemCount: itemVM.MenuList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20
              ),
                  itemBuilder: (context,index){
                    var mObj = itemVM.MenuList[index];
                    return Container(
                      height: 50,
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              var index = mObj["index"];
                              switch (index) {
                                case "1":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProfileScreen(userId: widget.userId,)),
                                  );
                                  break;
                                case "2":
                                // Add navigation or functionality for case "2"
                                  break;
                                case "3":
                                // Add navigation or functionality for case "3"
                                  break;
                                case "4":
                                // Add navigation or functionality for case "4"
                                  break;
                                case "5":
                                // Add navigation or functionality for case "5"
                                  break;
                                case "6":
                                // Add navigation or functionality for case "6"
                                  break;
                                case "7":
                                // Add navigation or functionality for case "7"
                                  break;
                                case "8":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FeePaymentScreen()),
                                  );
                                // Add navigation or functionality for case "8"
                                  break;
                                case "9":
                                // Add navigation or functionality for case "9"
                                  break;
                                case "10":
                                // Add navigation or functionality for case "10"
                                  break;
                                case "11":
                                // Add navigation or functionality for case "11"
                                  break;
                                case "12":
                                // Add navigation or functionality for case "12"
                                  break;
                                case "13":
                                // Add navigation or functionality for case "13"
                                  break;
                                case "14":
                                // Add navigation or functionality for case "14"
                                  break;
                                case "15":

                                // Add navigation or functionality for case "15"
                                  break;
                                default:
                                // Handle any case that doesn't match the specified ones
                                  break;
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Image.asset(
                                mObj["image"],
                                height: 30,
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            mObj["name"]
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
