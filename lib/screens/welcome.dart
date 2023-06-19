
import 'package:flutter/material.dart';
import 'package:novindus_api_project/screens/widget/button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(backgroundColor: Theme.of(context).primaryColor,body: 
      Center(child: Container(width: size.width/2,child: Image.asset('assets/images/logo.png')),),bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Button(width: size.width,ontap: () {

        }, height: 58, title: 'Get Started',bgcolor: Colors.white,textcolor: Theme.of(context).primaryColor),
      ),);
  }
}
