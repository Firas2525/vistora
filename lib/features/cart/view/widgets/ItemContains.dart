
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/model/home_model.dart';
import 'ItemDetailsColumn.dart';

class ItemContains extends StatelessWidget {
  const ItemContains({Key? key, required this.result}) : super(key: key);
  final ResultModel result;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            result.image,
            width: width * 0.3,
            height: width * 0.3,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              if (kDebugMode) {
                print(error);
              }
              return SizedBox(
                width: width * 0.3,
                height: width * 0.3,
                child: const Center(
                  child: Icon(Icons.image_not_supported,
                      size: 50, color:  AppColors.specialPink),
                ),
              );
            },
          ),
        ),
        SizedBox(width: width * 0.02),
        Expanded(
          child: ItemDetailsColumn(result: result),
        ),
      ],
    );
  }
}
