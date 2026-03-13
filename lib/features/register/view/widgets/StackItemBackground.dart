import 'package:flutter/material.dart';
class StackItemBackground extends StatelessWidget {
  const StackItemBackground({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Container(
      height: height * 0.96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:color,
      ),
      margin: EdgeInsets.only(
          left: width * 0.02, right: width * 0.02, top:height * 0.03
        //,bottom: height*0.1
      ),
    );
  }
}
