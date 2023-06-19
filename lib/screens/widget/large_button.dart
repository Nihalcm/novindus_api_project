import 'package:flutter/material.dart';

class LargeButton extends StatefulWidget {
  LargeButton(
      {Key? key,
      required this.width,
      required this.ontap,
      required this.height,
      required this.title,
      this.icon,
      this.bgcolor,
      this.textcolor})
      : super(key: key);

  final double width;
  final double height;
  final String title;
  final Widget? icon;
  final Color? textcolor;
  final Color? bgcolor;
  final Function() ontap;

  @override
  State<LargeButton> createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.bgcolor != null
              ? widget.bgcolor
              : Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                color:
                    widget.textcolor != null ? widget.textcolor : Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Axiforma',
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
