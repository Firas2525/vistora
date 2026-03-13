import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../image/view/image.dart';



class PageViewImages extends StatefulWidget {
  const PageViewImages({Key? key, required this.images, required this.controller}) : super(key: key);
  final List images;
  final PageController controller;
  @override
  State<PageViewImages> createState() => _PageViewImagesState();
}

class _PageViewImagesState extends State<PageViewImages> {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          height: height * 0.65,
          child: PageView.builder(
            itemCount: widget.images.length,
            controller: widget.controller,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(() => ShowImage(
                      image:
                      "${widget.images[index]}"),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${widget.images[index]}"),
                    //  fit: BoxFit.fill,
                      onError: (exception, stackTrace) {
                        if (kDebugMode) {
                          print(exception);
                        }
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(
                top: height * 0.03, right: width * 0.04),
            child: const CircleAvatar(
              backgroundColor: Colors.white10,
              child: Icon(
                Icons.arrow_back,
                color: AppColors.specialPink,
              ),
            ),
          ),
        )
      ],
    );
  }
}
