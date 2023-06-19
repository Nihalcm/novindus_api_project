

import 'package:flutter/material.dart';
import 'package:novindus_api_project/screens/home/home_page.dart';
import 'package:novindus_api_project/screens/login/login.dart';
import 'package:novindus_api_project/screens/welcome.dart';
import 'package:novindus_api_project/services/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (context) => Auth()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => HomePage(),
          '/login':(context) => LoginPage()
        },
        theme: ThemeData(
          primaryColor: Color(0xFFFC153B),
          focusColor: Color(0xFF2B2B2B),
        ),
        home: const WelcomePage(),
      )
    );
  }
}
