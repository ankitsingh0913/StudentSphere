import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool hasContent = false;
  bool _isSearchBarFocused = false;
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
          'Activity',
          style: TextStyle(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/dots.png",height: 25,color: Colors.white,),
          ),
        ],
      ),
      body: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                // controller: homeVM.txtSearch.value,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    width: 30,
                    child: Icon(
                      Icons.search
                    )
                  ),
                  hintText: _isSearchBarFocused ? '':"Search...",
                  hintStyle: const TextStyle(
                    // color: TColor.primaryText28,
                    fontSize: 15,
                  ),
                ),
                onTap: (){
                  setState(() {
                    _isSearchBarFocused = true;
                  });
                },
                onChanged: (value){
                  if(value.isEmpty){
                    setState(() {
                      _isSearchBarFocused = false;
                    });
                  }
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.filter_list_rounded,
                  color: Colors.black,
                  size: 27,
                ),
              )
            ],
          ),
          (hasContent) ?
            Column()
              :
            Center(
              child: Text(
                "No Chat Found",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            )
        ],
      ),
    );
  }
}
