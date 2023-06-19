
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/provider/provider.dart';
import '../../widget/large_button.dart';
import '../../widget/small_button.dart';
import 'add_driver.dart';
import 'driver_view.dart';

class AllDriver extends StatefulWidget {
  const AllDriver({Key? key}) : super(key: key);

  @override
  State<AllDriver> createState() => _AllDriverState();
}

class _AllDriverState extends State<AllDriver> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fetchDrivers();
    });
  }

  Future<void> _fetchDrivers() async {
    setState(() {
      _isLoading = true;
    });

    final authProvider = Provider.of<Auth>(context, listen: false);
    await authProvider.fetchDrivers();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final driverProvider = Provider.of<Auth>(context);
    final drivers = driverProvider.drivers;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).focusColor,
        title: Text(
          'Driver List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: "Axiforma",
            fontSize: 16,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${drivers!.driverList.length ?? 0} Drivers Found',
                    style: TextStyle(
                      color: Color(0xFF6B6B6B),
                      fontSize: 15,
                      fontFamily: "Axiforma",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: drivers?.driverList.length ?? 0,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final driver = drivers?.driverList[index];
                  print(drivers);
                  return Container(
                    height: 70,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC1C1C1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              driver?.name ?? '',
                              style: TextStyle(
                                fontFamily: 'Axiforma',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Licn no: ${driver?.licenseNo ?? ''}',
                              style: TextStyle(
                                fontFamily: 'Axiforma',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        SmallButton(
                          width: 70,
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DriverView(
                                  driverId: driver!.id,
                                  licence: driver!.licenseNo,
                                  phone: driver.mobile,
                                  name: driver.name,
                                ),
                              ),
                            ).then((_) {
                              // This code will execute after returning from the DriverView page
                              _fetchDrivers();
                            });
                          },
                          height: 30,
                          title: 'Manage',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 5, right: 20, left: 20, bottom: 20),
        child: LargeButton(
          width: size.width,
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDriver(),
              ),
            ).then((_) {
              // This code will execute after returning from the AddDriver page
              _fetchDrivers();
            });
          },
          height: 58,
          title: "Add Driver",
        ),
      ),
    );
  }
}
