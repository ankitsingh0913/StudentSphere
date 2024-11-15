// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image/image.dart' as img;
//
// class ProfilePictureScreen extends StatefulWidget {
//   const ProfilePictureScreen({super.key});
//
//   @override
//   State<ProfilePictureScreen> createState() => _ProfilePictureScreenState();
// }
//
// class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
//   ImagePicker _picker = ImagePicker();
//   XFile? _imageFile; // Allow _imageFile to be null
//
//   // Function to pick an image from the gallery
//   Future<void> _pickImage() async {
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = pickedFile;
//       });
//     }
//   }
//
//   // Function to crop the selected image
//   Future<void> _cropImage() async {
//     if (_imageFile == null) return; // Check if image is null before cropping
//
//     final CroppedFile? croppedFile = await ImageCropper().cropImage(
//       sourcePath: _imageFile!.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: 'Crop Image',
//           toolbarColor: Colors.deepOrange,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.square,
//           lockAspectRatio: false,
//         ),
//         IOSUiSettings(
//           minimumAspectRatio: 1.0,
//           resetButtonHidden: true,
//         ),
//       ],
//     );
//
//     if (croppedFile != null) {
//       setState(() {
//         _imageFile = XFile(croppedFile.path);
//       });
//     }
//   }
//
//   // Function to rotate the image
//   Future<void> _rotateImage() async {
//     if (_imageFile == null) return; // Check if image is null before rotating
//
//     // Load the image using the image package
//     final img.Image? image = img.decodeImage(File(_imageFile!.path).readAsBytesSync());
//
//     if (image != null) {
//       // Rotate the image by 90 degrees
//       final rotatedImage = img.copyRotate(image, angle: 90); // Correct usage
//
//       // Save the rotated image
//       final rotatedFile = File(_imageFile!.path)..writeAsBytesSync(img.encodeJpg(rotatedImage));
//
//       setState(() {
//         _imageFile = XFile(rotatedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black12,
//       appBar: AppBar(
//         backgroundColor: Colors.black12,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//             size: 35,
//           ),
//         ),
//         title: Text("Profile Picture", style: TextStyle(color: Colors.white)),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit, color: Colors.white),
//             onPressed: _pickImage,
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 50),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: _imageFile == null
//                   ? Image.asset("assets/images/ankit1.jpg") // Default image
//                   : Image.file(File(_imageFile!.path)), // Display the picked image
//             ),
//           ),
//           SizedBox(height: 20),
//           _imageFile != null
//               ? Column(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.crop, size: 30),
//                 onPressed: _cropImage,
//               ),
//               IconButton(
//                 icon: Icon(Icons.rotate_right, size: 30),
//                 onPressed: _rotateImage,
//               ),
//             ],
//           )
//               : SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
