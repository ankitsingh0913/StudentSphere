import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:studentsphere/Common%20Widget/newstile.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime _selectedDate = DateTime.now();
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
          'Calender',
          style: TextStyle(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_call_outlined,
                size: 30,
                color: Colors.white,
              )
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.menu_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: GoogleFonts.lato().fontFamily
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              daysCount: 120,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.blueAccent,
              selectedTextColor: Colors.white,
              // calendarType: CalendarType.gregorianDate,
              dateTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontFamily: GoogleFonts.lato().fontFamily
              ),
              dayTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontFamily: GoogleFonts.lato().fontFamily
              ),
              monthTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontFamily: GoogleFonts.lato().fontFamily
              ),
              onDateChange: (date){
                _selectedDate = date;
              },
            ),
          ),
          SizedBox(height: 20,),
          NewsTileCell(title: "IPR lecture", detail: '', onPressed: () {  },),
          NewsTileCell(title: "ALAP lecture", detail: '', onPressed: () {  },),
          NewsTileCell(title: "PRCV lecture", detail: '', onPressed: () {  },),



        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Colors.blueAccent,
        shape: CircleBorder(),
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
