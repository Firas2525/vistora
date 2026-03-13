import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({Key? key, required this.label, required this.myController, required this.icon}) : super(key: key);
  final String label;
  final TextEditingController myController;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: TextFormField(
        controller: myController,
        cursorColor: Colors.black,
        style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.black, width: 3)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.black, width: 2)),
            icon: Padding(
              padding:  EdgeInsets.only(top: 7),
              child: Icon(icon,color: Colors.black,size: width*0.06),
            ),
            label: Text(
              " $label ",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
