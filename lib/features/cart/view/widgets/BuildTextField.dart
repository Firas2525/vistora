import 'package:clothesget/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {Key? key,
        required this.controller,
        required this.hint,
        required this.icon,
        this.isNumber = false})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: AppColors.specialPink),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        prefixIcon: Icon(icon, color: Colors.black),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black, width: 4),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}