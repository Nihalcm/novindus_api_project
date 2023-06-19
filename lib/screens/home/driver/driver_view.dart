import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/provider/provider.dart';
import 'package:http/http.dart' as http;


class DriverView extends StatefulWidget {
  DriverView({
    Key? key,
    this.driverId,
    required this.phone,
    required this.name,
    required this.licence,
  }) : super(key: key);

  final int? driverId;
  final String name;
  final String licence;
  final String phone;

  @override
  State<DriverView> createState() => _DriverViewState();
}
Auth auth=Auth();
class _DriverViewState extends State<DriverView> {




  Row detail(size, title, description) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.20,
          child: Text(
            '$title:',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 13,
              fontFamily: "Axiforma",
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white),
          ),
          width: size.width * 0.60,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Axiforma',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).focusColor,
        title: Text(
          'Driver Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: "Axiforma",
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            print(widget.driverId);
                            showDialog(
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
                                                  'Are you sure you\n want to Delete the Driver?',
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
                                                        // Provider.of<Auth>(context,listen: false).deleteDriver(widget.driverId.toString()).then((value) => Navigator.pop(context)).then((value) => Navigator.pop(context));
                                                      },
                                                      child: Text(
                                                        'Confirm',
                                                        style:TextStyle(
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
                            );

                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Axiforma',
                      ),
                    ),
                    SizedBox(height: 10),
                    detail(size, 'Licence No', widget.licence),
                    SizedBox(height: 15),
                    detail(size, 'Mobile', widget.phone),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
