import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String content;

  const EmptyPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: width * 0.035,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
