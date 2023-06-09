import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Palette.dart';

class CustomTextInputField extends StatefulWidget {
  final bool enablePasswordField;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? editingController;
  final String? Function(String?)? validator;
  bool obscureTextPassword;
  CustomTextInputField(
      {Key? key,
      required this.hintText,
      required this.keyboardType,
      this.editingController,
        this.validator,
      this.enablePasswordField = false,
      this.obscureTextPassword=false,})
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
        validator: widget.validator,
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
                      widget.obscureTextPassword =
                          !widget.obscureTextPassword;
                    });
                  },
                  child: Icon(

                    widget.obscureTextPassword
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
