import 'package:flutter/material.dart';
class InfoRow extends StatelessWidget {
  const InfoRow({Key? key, required this.icon, required this.text}) : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(children: [
      Expanded(
        flex: 2,
        child: Container(),
      ),
      Expanded(
        flex: 4,
        child: Icon(icon),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
          flex: 30,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.04),
          ))
    ]);
  }
}