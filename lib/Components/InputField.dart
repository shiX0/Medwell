import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Palette.dart';

class CustomTextInputField extends StatefulWidget {
  final bool enablePasswordField;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? editingController;
  bool _obscureTextPassword = true;
  CustomTextInputField(
      {Key? key,
      required this.hintText,
      required this.keyboardType,
      this.editingController,
      this.enablePasswordField = false})
      : super(key: key);
  @override
  State<CustomTextInputField> createState() => _CustomTextInputField();
}

class _CustomTextInputField extends State<CustomTextInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 60,
      decoration: BoxDecoration(
        color: Pallete.accent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.labelMedium,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        controller: widget.editingController,
        obscureText: widget.enablePasswordField,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.labelMedium,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              fontSize: 16),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          suffixIcon: widget.enablePasswordField
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget._obscureTextPassword =
                          !widget._obscureTextPassword;
                    });
                  },
                  child: Icon(
                    widget._obscureTextPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20.0,
                    color: Colors.black,
                  ))
              : null,
        ),
      ),
    );
  }
}
