import 'dart:convert';

import 'package:clothes_app/api_connection/api_connection.dart';
import 'package:clothes_app/users/authentication/login_screen.dart';
import 'package:clothes_app/users/model/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, cons) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: cons.maxHeight,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // login screen header
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 284,
                      child: Image.asset("assets/images/register.jpg"),
                    ),

                    //login screen sign in form
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.black26,
                                  offset: Offset(0, -3))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                          child: Column(
                            children: [
                              // email-password-login btn
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      //name
                                      TextFormField(
                                        controller: nameController,
                                        validator: (val) => val == ""
                                            ? "Please write name"
                                            : null,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            prefixIcon: const Icon(Icons.person,
                                                color: Colors.black),
                                            hintText: "name..",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(horizontal: 14, vertical: 6)),
                                      ),
                                      const SizedBox(height: 18),
                                      //email
                                      TextFormField(
                                        controller: emailController,
                                        validator: (val) => val == ""
                                            ? "Please write email"
                                            : null,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            prefixIcon: const Icon(Icons.email,
                                                color: Colors.black),
                                            hintText: "email..",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(horizontal: 14, vertical: 6)),
                                      ),
                                      const SizedBox(height: 18),
                                      // password
                                      Obx(
                                        () => TextFormField(
                                          controller: passwordController,
                                          obscureText: isObsecure.value,
                                          validator: (val) => val == ""
                                              ? "Please write passworrd"
                                              : null,
                                          decoration: InputDecoration(
                                              suffixIcon:
                                                  Obx(() => GestureDetector(
                                                        onTap: () {
                                                          isObsecure.value =
                                                              !isObsecure.value;
                                                        },
                                                        child: Icon(
                                                          isObsecure.value
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .visibility,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                              fillColor: Colors.white,
                                              filled: true,
                                              prefixIcon: const Icon(Icons.vpn_key,
                                                  color: Colors.black),
                                              hintText: "password..",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white30)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white30)),
                                              focusedErrorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white30)),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white30)),
                                              contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 14, vertical: 6)),
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                      Material(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                        child: InkWell(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              validateUserEmail();
                                            }
                                          },
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 28),
                                            child: Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: 16,
                              ),
                              //dont have an account button - button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have an Account"),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(const LoginScreen());
                                      },
                                      child: const Text(
                                        "Login here",
                                        style: TextStyle(
                                            color: Colors.purpleAccent),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': emailController.text.trim(),
        },
      );
      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = await jsonDecode(res.body);
        if (resBodyOfValidateEmail['emailFound']) {
          Fluttertoast.showToast(msg: "Email is already use.");
        } else {
          registerAndSaveUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void registerAndSaveUserRecord() async {
    User userModel = User(
        passwordController.text, emailController.text, 1, nameController.text);
    try {
      var res =
          await http.post(Uri.parse(API.signUp), body: userModel.toJson());
      if (res.statusCode == 200) {
        var resBodyOfSignUp = await jsonDecode(res.body);
        if (resBodyOfSignUp["success"]) {
          Fluttertoast.showToast(msg: "Sign up successfully");
        } else {
          Fluttertoast.showToast(msg: "Error Occurred try again");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
