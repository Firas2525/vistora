import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../model/order_model.dart';
class OrderProducts extends StatelessWidget {
  const OrderProducts({Key? key, required this.order}) : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        color:  AppColors.background,
        child:ListView.builder(
          padding: EdgeInsets.only(top: height*0.02),
          itemCount:order.orderProducts.length ,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  "الاسم : ${order.orderProducts[index].name}",
                  style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: height*0.005,),
                Text(
                  "السعر : ${order.orderProducts[index].price}",
                  style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.bold,
                      color:  AppColors.specialPink
                  ),
                ),
                SizedBox(height: height*0.01,),
                Divider(height: height*0.02,color: Colors.black,thickness: 1,indent: width*0.15,endIndent: width*0.15,),
                SizedBox(height: height*0.02,),
              ],
            );
          },)
    ) ;
  }
}