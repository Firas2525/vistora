import 'package:flutter/material.dart';

class BuildNavItem extends StatelessWidget {
  const BuildNavItem(
      {Key? key,
        required this.title,
        required this.onTap,
        required this.width,
        this.isSelected = false})
      : super(key: key);
  final String title;
  final VoidCallback onTap;
  final double width;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10),
          )
              : null,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: width * 0.03,
            ),
          ),
        ),
      ),
    );
  }
}