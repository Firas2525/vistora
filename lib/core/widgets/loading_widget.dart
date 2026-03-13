import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingWidget({
    Key? key,
    this.size = 80,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        size: size,
        color: color,
      ),
    );
  }
}
