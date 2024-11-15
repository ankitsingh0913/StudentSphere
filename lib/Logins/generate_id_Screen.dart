import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard functionality
import 'package:http/http.dart' as http;

class GenerateIDScreen extends StatefulWidget {
  @override
  _GenerateIDScreenState createState() => _GenerateIDScreenState();
}

class _GenerateIDScreenState extends State<GenerateIDScreen> {
  TextEditingController originalEmailController = TextEditingController();
  final TextEditingController enrollmentController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final String collegeShortForm = 'msit'; // Can be predefined or entered by the user

  String? generatedEmail;
  String? generatedPassword;

  // Function to call API and generate email and password
  Future<void> generateEmailAndPassword() async {
    final String apiUrl = 'http://192.168.1.36:3004/api/user/register-generated';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'batch': batchController.text,
        'name': nameController.text,
        'enrollmentNo': enrollmentController.text,
        'collegeShortForm': collegeShortForm,
        'originalEmail': originalEmailController.text, // Include original email here
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        generatedEmail = data['generatedEmail'];
        generatedPassword = data['generatedPassword'];
      });
    } else {
      print('Failed to generate credentials');
    }
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Copied to clipboard")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Email and Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: batchController,
                    decoration: InputDecoration(labelText: 'Batch'),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Full Name'),
                  ),
                  TextField(
                    controller: originalEmailController,
                    decoration: InputDecoration(
                      labelText: 'Your Original Email',
                    ),
                  ),
                  TextField(
                    controller: enrollmentController,
                    decoration: InputDecoration(labelText: 'Enrollment Number'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: generateEmailAndPassword,
                    child: Text('Generate Email and Password'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            if (generatedEmail != null && generatedPassword != null)
              Center(
                child: Container(
                  height: 475,
                  width: 700,
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                    backgroundColor: Colors.indigo.shade50,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Login Credentials:",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: SelectableText(
                                "Email: $generatedEmail",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.copy, color: Colors.indigo),
                              onPressed: () {
                                copyToClipboard(generatedEmail!);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: SelectableText(
                                "Password: $generatedPassword",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.copy, color: Colors.indigo),
                              onPressed: () {
                                copyToClipboard(generatedPassword!);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Thank You",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.indigo, // Button color
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rounded button
                          ),
                        ),
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
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
}
