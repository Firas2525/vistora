import 'package:flutter/material.dart';
import '../../home/model/home_model.dart';
import 'descriptionBody.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.result}) : super(key: key);
  final ResultModel result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DescriptionBody(result : result),
    );
  }
}
