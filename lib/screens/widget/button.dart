import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button({
    Key? key,
    required this.width,
    required this.ontap,
    required this.height,
    required this.title,
    this.icon,
    this.bgcolor,
    this.textcolor
  }) : super(key: key);

  final double width;
  final double height;
  final String title;
  final Widget? icon;
  final Color? textcolor;
  final Color? bgcolor;
  final Function() ontap;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.bgcolor !=null?widget.bgcolor:Color(0xFF00A699),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: widget.textcolor !=null?widget.textcolor:Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Axiforma',fontSize: 20),
          ),
        ),
      ),
    );
  }
}
