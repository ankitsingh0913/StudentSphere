import 'package:get/get.dart';

class ItemlistsViewModel extends GetxController {
  final List<Map<String, dynamic>> ItemlistArr = [
    {
      "count":"1",
      "image":"assets/images/id-card.png",
      "name":"Student ID",
    },
    {
      "count":"2",
      "image": "assets/images/user.png",
      "name": "Profile",
    },
    {
      "count":"3",
      "image": "assets/images/bell.png",
      "name": "Reminders",

    },
  ].obs;

  // final List<Map<String, dynamic>> DetaillistArr = [
  //   {
  //     "image": "assets/images/CheckList.png",
  //     "name": "Checklist"
  //   },
  //   {
  //     "image": "assets/images/GuestList.png",
  //     "name": "GuestList"
  //   },
  //   {
  //     "image": "assets/images/Invitation.png",
  //     "name": "Invitation"
  //   },
  //   {
  //     "image": "assets/images/Budget.png",
  //     "name": "Budget"
  //   }
  // ].obs;

  final List<Map<String, dynamic>> notification = [

    {
      "image": "assets/images/profile_demo.png",
      "message": "OS class CSE-1",
      "content": "You have a pending Assignment"
    },
    {
      "image": "assets/images/profile_demo.png",
      "message": "OS class CSE-1",
      "content": "New Assignment "
    },
    {
      "image": "assets/images/profile_demo.png",
      "message": "Admin",
      "content": "Your fee has been submitted and recipe send to your mail"
    },
    {
      "image": "assets/images/profile_demo.png",
      "message": "Admin",
      "content": "Welcome to StudentSphere"
    },
  ].obs;

  final List<Map<String, dynamic>> classes = [
    {
      "class": "ML CSE-1",
    },
    {
      "class": "ALAP CSE-1",
    },
    {
      "class": "PRCV CSE-1",
    },
    {
      "class": " NGW CSE-1",
    },
    {
      "class": "RLDL CSE-1",
    },
    {
      "class": "IPR CSE-1",
    },
  ].obs;

  final List<Map<String, dynamic>> MenuList = [
    {
      "index": "1",
      "image": "assets/images/user.png",
      "name": "Profile"
    },
    {
      "index": "2",
      "image": "assets/images/calendar.png",
      "name": "Timetable"
    },
    {
      "index": "3",
      "image": "assets/images/attendance.png",
      "name": "Attendance"
    },
    {
      "index": "4",
      "image": "assets/images/curriculum.png",
      "name": "Course"
    },
    {
      "index": "5",
      "image": "assets/images/assignment.png",
      "name": "Assignment"
    },
    {
      "index": "6",
      "image": "assets/images/academic.png",
      "name": "Academics"
    },
    {
      "index": "7",
      "image": "assets/images/enroll.png",
      "name": "Enroll in Course"
    },
    {
      "index": "8",
      "image": "assets/images/hand.png",
      "name": "Fee"
    },
    {
      "index": "9",
      "image": "assets/images/star.png",
      "name": "QEC Rank"
    },
    {
      "index": "10",
      "image": "assets/images/staff.png",
      "name": "Staff"
    },
    {
      "index": "11",
      "image": "assets/images/donation.png",
      "name": "Financial Aid"
    },
    {
      "index": "12",
      "image": "assets/images/book.png",
      "name": "Library"
    },
    {
      "index": "13",
      "image": "assets/images/schedule.png",
      "name": "Schedule"
    },
    {
      "index": "14",
      "image": "assets/images/map.png",
      "name": "Map"
    },
    {
      "index": "15",
      "image": "assets/images/exclamation.png",
      "name": "Emergency Info"
    },
    {
      "index": "16",
      "image": "assets/images/more.png",
      "name": "more"
    }
  ].obs;

}