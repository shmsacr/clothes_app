import 'package:clothes_app/users/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
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
                      child: Image.asset("assets/images/login.jpg"),
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
                                      //email
                                      TextFormField(
                                        controller: emailController,
                                        validator: (val) => val == ""
                                            ? "Please write email"
                                            : null,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            prefixIcon: Icon(Icons.email,
                                                color: Colors.black),
                                            hintText: "email..",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                    color: Colors.white30)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                    color: Colors.white30)),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                    color: Colors.white30)),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.white30)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 14,
                                                    vertical: 6)),
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
                                              prefixIcon: Icon(Icons.vpn_key,
                                                  color: Colors.black),
                                              hintText: "password..",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                      color: Colors.white30)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                      color: Colors.white30)),
                                              focusedErrorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                      color: Colors.white30)),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                      color: Colors.white30)),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 6)),
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                      Material(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                        child: InkWell(
                                          onTap: () {},
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 28),
                                            child: Text(
                                              "Login",
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
                                  Text("Don't have an Account"),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(SignUpScreen());
                                      },
                                      child: Text(
                                        "Sign Up here",
                                        style: TextStyle(
                                            color: Colors.purpleAccent),
                                      ))
                                ],
                              ),
                              const Text(
                                "or",
                                style: TextStyle(color: Colors.grey),
                              ),
                              // are you admin - button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Are you an Admin ?"),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Click here",
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
}
