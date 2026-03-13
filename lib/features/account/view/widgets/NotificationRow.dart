import 'package:clothesget/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../notification/view/notification.dart';
class NotificationRow extends StatelessWidget {
  const NotificationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "اشعاراتك على التطبيق ",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.03),
        ),
        SizedBox(width: width*0.02,),
        InkWell(
          onTap: (){
            Get.to(() => NotificationPage());
          },
          child: Text(
            "عرض الاشعارات",
            style: TextStyle(
                color: AppColors.specialPink,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.032),
          ),
        ),
      ],
    );
  }
}