import 'package:flutter/material.dart';

import '../AppText/Apptext.dart';
import '../Colors/colors.dart';

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

class AppButton extends StatefulWidget {
  final Function() onPressed;
  final String btntext;
  final Color? btntextcolor;
  final Color? btncolor;
  final double? btntextsize;
  const AppButton(
      {super.key,
      required this.onPressed,
      required this.btntext,
      this.btntextcolor,
      this.btntextsize,
      this.btncolor});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: widget.btncolor),
      onPressed: widget.onPressed,
      child: AppText(
          text: widget.btntext,
          color: widget.btntextcolor,
          size: widget.btntextsize),
    );
  }
}

class Appfield extends StatefulWidget {
  final String? labelText;

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool obscureText;
  final Widget? SuffixIcon;
  const Appfield(
      {super.key,
      this.labelText,
      this.controller,
      this.prefixIcon,
      this.SuffixIcon,
      this.obscureText = false});

  @override
  State<Appfield> createState() => _AppfieldState();
}

class _AppfieldState extends State<Appfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.black10),
        child: TextFormField(
          controller: widget.controller,
          style: TextStyle(fontFamily: 'Pip'),
          obscureText: widget.obscureText,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              hintText: widget.labelText,
              hintStyle: TextStyle(fontFamily: 'Pip', color: AppColors.grey),
              enabledBorder: InputBorder.none,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.SuffixIcon,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}

class backbutton extends StatefulWidget {
  final Function() backbtn;

  final Color? containercolor;
  final Color? iconcolor;
  const backbutton(
      {super.key,
      required this.backbtn,
      this.containercolor = Colors.white,
      this.iconcolor = Colors.black});

  @override
  State<backbutton> createState() => _backbuttonState();
}

class _backbuttonState extends State<backbutton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: CircleAvatar(
        radius: 3,
        backgroundColor: AppColors.black10,
        child: IconButton(
            onPressed: widget.backbtn,
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: widget.iconcolor,
            )),
      ),
    );
  }
}
