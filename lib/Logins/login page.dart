import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsphere/Logins/generate_id_Screen.dart';
import '../TABS/Main Tab/maintab.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final hidePassword = false.obs;
  bool _isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Map<String, dynamic>? userData;

  Future<void> loginUser(String email, String password) async {
    final String apiUrl = 'http://192.168.1.36:3004/api/user/login';
    setState(() {
      _isLoading = true;
    });

    try {
      print("Attempting to login with $email and $password");
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        userData = data['user'];
        String userId = userData?['_id'];
        print(userId);

        if (data['success']) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainTabView(userId: userId)),
          );
        } else {
          Get.snackbar('Login Failed', data['message']);
        }
      } else {
        Get.snackbar('Error', 'Failed to log in. Check your credentials.');
      }
    } catch (error) {
      print("Caught error: $error");

      Get.snackbar('Error', 'An error occurred during login',);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'STUDENT SPHERE',
          style: TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.w700
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.school_outlined, color: Colors.white, size: 30,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 150.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            height: 410,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WELCOME',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.alternate_email),
                            labelStyle: const TextStyle(color: Color(0xFF3d072f)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: hidePassword.value,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_open),
                            suffixIcon: IconButton(
                              onPressed: () => hidePassword.value = !hidePassword.value,
                              icon: Icon( hidePassword.value ? Icons.visibility_off : Icons.visibility),
                            ),
                            labelStyle: const TextStyle(color: Color(0xFF3d072f)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Enter Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '  Forget Password ?  ',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  decorationThickness: 1.0,
                                  color: Colors.blueAccent,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Get.to(() => GenerateIDScreen());
                              },
                              child: Text(
                                "Don't have an email !" ,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                    decorationThickness: 1.0,
                                    color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            loginUser(emailController.text, passwordController.text);
                            // Get.to(() => MainTabView());
                          },
                          icon: _isLoading ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Color(0xFFC7AE6A),
                              strokeWidth: 2,
                            ),
                          )
                              : const SizedBox.shrink(),
                          label: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff001692),
                            minimumSize: const Size(350, 50),
                            padding: const EdgeInsets.symmetric(horizontal: 50.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // if(_formKey.currentState!.validate()){
                            //   login();
                            //   setState(() {
                            //     _isLoading = true;
                            //   });
                            // }
                            // Get.to(() => const MainTabView(,));
                          },
                          icon: _isLoading ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Color(0xFFC7AE6A),
                              strokeWidth: 2,
                            ),
                          )
                              : const SizedBox.shrink(),
                          label: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffcfcfcf),
                            minimumSize: const Size(350, 50),
                            padding: const EdgeInsets.symmetric(horizontal: 50.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
