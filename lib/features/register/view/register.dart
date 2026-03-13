import 'package:flutter/material.dart';

import '../../register/view/ListViewBody.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(decoration: const BoxDecoration(), child: const ListViewBody()),
    );
  }
}
