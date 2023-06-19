import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/provider/provider.dart';
import '../../../services/utils/api.dart';
import '../../widget/small_button.dart';
import 'bus_view.dart';

class AllBuses extends StatefulWidget {
  const AllBuses({Key? key}) : super(key: key);

  @override
  State<AllBuses> createState() => _AllBusesState();
}

class _AllBusesState extends State<AllBuses> {
  var uri=Api.authUrl;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fetchBuses();
    });
  }
  Future<void> _fetchBuses() async {
    setState(() {
      _isLoading = true;
    });

    final authProvider = Provider.of<Auth>(context, listen: false);
    await authProvider.fetchbus();

    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final busProvider = Provider.of<Auth>(context);
    final buses = busProvider.buses;
    final size = MediaQuery.of(context).size;

    return Scaffold( appBar: AppBar(
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
        'Bus List',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: "Axiforma",
          fontSize: 16,
        ),
      ),
    ),
      body:_isLoading? Center(
        child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor),
      ):SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [Row(
              children: [
                Text(
                  '${buses?.bus.length ?? 0} Buses Found',
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
                itemCount: buses!.bus.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Color(0xFFC1C1C1), blurRadius: 5)
                        ]),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                        ),
                        width: size.width * 0.20,
                        height: size.height * 0.10,
                     child:  ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),child: Image.network("https://flutter-api.noviindus.in/${buses.bus[index].image}",fit: BoxFit.cover,)), ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(buses!.bus[index].name,
                              style: TextStyle(
                                  fontFamily: 'Axiforma',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                          Text(buses!.bus[index].type,
                              style: TextStyle(
                                  fontFamily: 'Axiforma',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      Spacer(),
                      SmallButton(
                          width: 70, ontap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BusView(type: "1*3",busname: buses!.bus[index].name,bustype: buses!.bus[index].type,drivername: buses!.bus[index].driverName,licenceno: buses!.bus[index].driverLicenseNo),));
                      }, height: 30, title: 'Manage'),
                      SizedBox(
                        width: 20,
                      )
                    ]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
