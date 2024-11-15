import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studentsphere/Models/lists.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  final itemVM = Get.put(ItemlistsViewModel());
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
          'Classes',
          style: TextStyle(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/left-align.png",height: 22,color: Colors.white,),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/dots.png",height: 25,color: Colors.white,),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: itemVM.classes.length,
        itemBuilder: (context,index){
          var mObj = itemVM.classes[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: Colors.blue[100],
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
                  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mObj["class"],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[900],
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),

            ),
          );
        }
      ),
    );
  }
}
