import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch(
      {Key? key, required this.controller, required this.function})
      : super(key: key);
  final TextEditingController controller;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.045,
        color: Colors.white38,
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          onEditingComplete: () {
            function();
          },
          decoration: const InputDecoration(
              label: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.search)),
              prefix: SizedBox(
                width: 30,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}
