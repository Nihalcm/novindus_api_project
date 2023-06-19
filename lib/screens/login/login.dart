import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../services/provider/provider.dart';
import '../widget/large_button.dart';
import '../widget/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            actions: [
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Are you sure you\n want to exit the app?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                        Colors.black),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 1,
                                  height: 20,
                                  color: Colors.grey,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    SystemNavigator.pop();
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )),
                ],
              )
            ],
          ),
        ) ??
            false;

    },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.40,
                  width: size.width,
                  color: Theme.of(context).focusColor,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: size.height * 0.40,
                          width: size.width,
                          child: Image.asset(
                            'assets/images/triangle.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                      fontFamily: 'Axiforma',
                                      fontSize: 41,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Manage your Bus and Drivers',
                                  style: TextStyle(
                                      fontFamily: 'Axiforma',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      FormTextfield(
                        title: "Enter Username",
                        textEditingController: namecontroller,
                      ),
                      SizedBox(height: 20,),
                      FormTextfield(
                        title: "Enter Password",
                        textEditingController: passwordcontroller,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: isLoading // Show loading indicator if isLoading is true
              ? Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50,height: 50,child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)),
                ],
              )
              : LargeButton(
            width: size.width,
            ontap: () {
              setState(() {
                isLoading = true; // Set isLoading to true
              });
              Provider.of<Auth>(context, listen: false).login(context, namecontroller.text, passwordcontroller.text);
              // Call login function and handle the loading state within the provider
            },
            height: 58,
            title: "Login",
          ),
        ),
      ),
    );
  }
}
