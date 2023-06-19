import 'package:flutter/material.dart';

class BusView extends StatefulWidget {
   BusView({Key? key,required this.type,required this.busname,
   required this.bustype,required this.drivername,required this.licenceno}) : super(key: key);
String type;
String drivername;
String licenceno;
String busname;
String bustype;
  @override
  State<BusView> createState() => _BusViewState();
}

class _BusViewState extends State<BusView> {
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
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: Theme.of(context).focusColor,
            title: Text(
              '${widget.busname} ${widget.bustype}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Axiforma",
                  fontSize: 16),
            )),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 116,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.drivername,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Axiforma'),
                              ),
                              Text(
                                'License no: ${widget.licenceno}',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 10),
                              )
                            ]),
                      ),
                      Positioned(
                          right: 30,
                          bottom: 0,
                          height: 116,
                          child: Image.asset('assets/images/men.png'))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFDCDCDC))),
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        Row(
                          children: [
                            Spacer(),
                            SizedBox(
                                width: size.width / 6,
                                child: Image.asset('assets/images/seat.png')),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.separated(physics: NeverScrollableScrollPhysics(),itemCount: 9,shrinkWrap: true,scrollDirection: Axis.vertical,separatorBuilder: (context, index) => SizedBox(height: 10,),itemBuilder: (context, index) {
                          return SizedBox(
                            child:widget.type=='1*3'?Row(
                              children: [
                                SizedBox(
                                    width: size.width / 8,
                                    child: Image.asset('assets/images/seat.png',
                                      color: Theme.of(context).primaryColor,)), Spacer(),
                                SizedBox(
                                    width: size.width / 8,
                                    child: Image.asset(
                                      'assets/images/seat.png',
                                      color: Theme.of(context).primaryColor,
                                    )),
                              SizedBox(width: 10,),
                                SizedBox(
                                    width: size.width / 8,
                                    child: Image.asset('assets/images/seat.png',
                                      color: Theme.of(context).primaryColor,)),
                                SizedBox(width: 10,),
                                SizedBox(
                                    width: size.width / 8,
                                    child: Image.asset('assets/images/seat.png',
                                      color: Theme.of(context).primaryColor,))
                              ],
                            ): Row(
                              children: [
                                SizedBox(
                                    width: size.width / 8,
                                    child: Image.asset('assets/images/seat.png',
                                      color: Theme.of(context).primaryColor,)), SizedBox(width: 10,),
                                SizedBox(
                                    width: size.width / 8,
                                    child: Image.asset(
                                      'assets/images/seat.png',
                                      color: Theme.of(context).primaryColor,
                                    )),
                                Spacer(),
                                SizedBox(
                                    width: size.width / 8,
                                    child: Image.asset('assets/images/seat.png',
                                      color: Theme.of(context).primaryColor,)),
                                SizedBox(width: 10,),
                                SizedBox(
                                    width: size.width / 8,
                                    child: Image.asset('assets/images/seat.png',
                                      color: Theme.of(context).primaryColor,))
                              ],
                            ),
                          );
                        },

                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
