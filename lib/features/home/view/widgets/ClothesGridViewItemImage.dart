import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';


class ClothesGridViewItemImage extends StatelessWidget {
  const ClothesGridViewItemImage({Key? key, required this.image})
      : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.fill,
          onError: (exception, stackTrace) {
            if (kDebugMode) {
              print(exception);
            }
          },
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
