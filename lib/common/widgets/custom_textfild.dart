import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? textFieldName;
  final String? hinText;
  final bool? obscureText;
  final Widget? priFixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final bool? obscureCharacter;
  final Color? focusColor;
  final Widget? outLineBorder;

  const CustomTextField({
    super.key,
    this.textFieldName,
    this.hinText,
    this.priFixIcon,
    this.suffixIcon,
    this.controller,
    this.textInputType,
    this.obscureCharacter,
    this.outLineBorder,
    this.focusColor,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          
          color: const Color(0xFFF3F3F3),

        ),
      child: TextFormField(
        // obscureText: obscureText,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            focusColor: focusColor,

            hintText: hinText,
            hintStyle: const TextStyle(fontSize: 14),
            prefixIcon: priFixIcon,
            suffixIcon: suffixIcon,
            iconColor: Colors.black,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color(0xFFFFFFFF),
                width: 0.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFFFFFFF),
              ),
            )),
      ),
    );
  }
}