import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';



class GridViewCategoriesItem extends StatelessWidget {
  const GridViewCategoriesItem(
      {Key? key,
      required this.title,
      required this.image,
      required this.selected})
      : super(key: key);
  final String title;
  final String image;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: selected
                ? [
                    const BoxShadow(
                        color: AppColors.specialPink,
                        blurRadius: 30,
                        offset: Offset(-2, 2),
                        blurStyle: BlurStyle.inner)
                  ]
                : null,
            color: Colors.grey.shade200,
          ),
          child: Container(
            width: height * 0.08,
            height: height * 0.08,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(image),
                  onError: (exception, stackTrace) {},
                )),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          title,
          style:
              TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
