import 'package:flutter/material.dart';
import 'CustomSearch.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key, required this.searchController, required this.function}) : super(key: key);
  final TextEditingController searchController;
  final Function function;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.06,
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
           Expanded(flex: 32, child: CustomSearch(controller:widget.searchController, function:widget.function,)),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),

        ],
      ),
    );
  }
}
