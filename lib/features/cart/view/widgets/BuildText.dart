import 'package:flutter/material.dart';
class BuildText extends StatelessWidget {
  const BuildText({Key? key, required this.text, required this.width})
      : super(key: key);
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: width * 0.03,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}