import 'package:flutter/material.dart';

class FormTextfield extends StatefulWidget {
  FormTextfield(
      {Key? key,
      required this.title,
      required this.textEditingController,
        this.keytype
     })
      : super(key: key);
  final String title;
  final TextInputType? keytype;
  final TextEditingController textEditingController;
  @override
  State<FormTextfield> createState() => _FormTextfieldState();
}

class _FormTextfieldState extends State<FormTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(keyboardType: widget.keytype!=null?widget.keytype:TextInputType.text,controller: widget.textEditingController,
      style: TextStyle(
          fontFamily: 'Axiforma',
          fontWeight: FontWeight.w500,
          fontSize: 15),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: widget.title,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(style: BorderStyle.none, width: 0)),
          fillColor: Color(0xFF2A2A2A).withOpacity(0.10),
          filled: true),
    );
  }
}
