import 'package:flutter/material.dart';

class AppText extends StatefulWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final String? family;
  const AppText(
      {super.key,
      required this.text,
      this.size = 12,
      this.weight,
      this.color,
      this.family = 'Pip'});

  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color,
          fontFamily: widget.family,
          fontSize: widget.size,
          fontWeight: widget.weight),
    );
  }
}
