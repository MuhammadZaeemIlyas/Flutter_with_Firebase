import 'package:firebase_flutter/customthings/AppText/Apptext.dart';
import 'package:firebase_flutter/customthings/Colors/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String? labelText;
  final TextEditingController? controller;
  final double? size;
  final FontWeight? weight;
  const AppTextField(
      {super.key, this.labelText, this.size, this.weight, this.controller});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color: Colors.black,
            fontSize: widget.size,
            fontWeight: widget.weight),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
