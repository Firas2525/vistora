import 'package:flutter/material.dart';
import 'BottomSheetTitle.dart';

class MyBottomSheetContent extends StatelessWidget {
  const MyBottomSheetContent({Key? key, required this.gridview, required this.title}) : super(key: key);
   final Widget gridview;
   final String title;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         Expanded(
            flex: 1,
            child: BottomSheetTitle(
              title: title,
            )),
        Expanded(flex: 7, child:gridview )
      ],
    );
  }
}
