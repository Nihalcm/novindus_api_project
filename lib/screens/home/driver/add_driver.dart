import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/model/drivermodel.dart';
import '../../../services/provider/provider.dart';
import '../../widget/large_button.dart';
import '../../widget/textfield.dart';


class AddDriver extends StatefulWidget {
  const AddDriver({Key? key}) : super(key: key);

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  Auth auth=Auth();


  void addDriver(BuildContext context) async {
    String name = namecontroller.text ?? '';
    String licenseNumber = licenseController.text ?? '';
    String phone = phonecontroller.text ?? '';

    if (name.isEmpty || licenseNumber.isEmpty || phone.isEmpty) {
      // Handle the case where any of the required fields are empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter all the required information."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return; // Exit the function
    }

    try {
      DriverList newDriver = DriverList(
        id: 0,
        name: name,
        mobile: phone,
        licenseNo: licenseNumber,
      );

      Provider.of<Auth>(context, listen: false).createDriver(newDriver);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Driver Added"),
            content: Text("The driver has been successfully added."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (error) {
      // Show an error message or handle the error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to add the driver. Error: $error"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }











  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).focusColor,
        title: Text('Add Driver',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontFamily:"Axiforma",fontSize: 16 ),)
    ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  FormTextfield(title: "Enter Name",textEditingController: namecontroller,)
                  ,SizedBox(height: 20,),
                  FormTextfield(title: "Enter License Number",textEditingController: licenseController,),
              SizedBox(height: 20,),
            FormTextfield(title: "Enter Mobile Number",textEditingController: phonecontroller,keytype: TextInputType.phone,)
                ],
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
        LargeButton(width: size.width, ontap: () {
          // Provider.of<Auth>(context,listen: false).addDriverAPI("John Doe", "1234567890", "ABC123XYZ");
          addDriver(context);
        }, height: 58, title: "Save"),
      ),
    );
  }
}
