
import 'package:flutter/material.dart';

import 'bus/all_buses.dart';
import 'driver/all_driver.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current=0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(onWillPop: () async{
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
                            'Are you sure you\n want to go to Login?',
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
                                      Theme.of(context).primaryColor),
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
                                  Navigator.pushReplacementNamed(context, '/login');
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
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Theme.of(context).focusColor,
          title: Center(
              child: SizedBox(
                  width: size.width / 3,
                  child: Image.asset('assets/images/logo.png'))),
        ),
        backgroundColor: Colors.white,
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [Spacer(),
                    InkWell(onTap: () {
                      setState(() {
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>    AllBuses(),));
                      });
                    },
                      child: Stack(
                        children: [
                          Container(
                            width: size.width / 2 - 30,
                            height: size.width / 2,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bus',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontFamily: "Axiforma"),
                                  ),
                                  Text(
                                    'Manage your Bus',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Axiforma",
                                        fontSize: 10),
                                  ),

                                ],
                              ),
                            ),
                          ),

                          Positioned(bottom: 10,right: 0,
                            child: SizedBox(
                                width: size.width / 3,
                                child: Image.asset(
                                  'assets/images/bus.png',
                                  fit: BoxFit.cover,
                                )),
                          )],
                      ),
                    ),
                    Spacer(),
                    InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AllDriver(),));
                    },
                      child: Stack(
                        children: [
                          Container(
                            width: size.width / 2 - 30,
                            height: size.width / 2,
                            decoration: BoxDecoration(
                                color: Theme.of(context).focusColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Driver',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontFamily: "Axiforma"),
                                  ),
                                  Text(
                                    'Manage your Driver',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Axiforma",
                                        fontSize: 10),
                                  ),

                                ],
                              ),
                            ),
                          ),

                          Positioned(bottom: 0.2,right: 11,
                            child: SizedBox(
                                width: size.width / 3,
                                child: Image.asset(
                                  'assets/images/men.png',
                                  fit: BoxFit.cover,
                                )),
                          )],
                      ),
                    ),Spacer(),
                  ],
                ),
                // SizedBox(height: 20,)
                // ,AllBuses()
              ],
            ),
          ),
        )),
      ),
    );
  }
}
