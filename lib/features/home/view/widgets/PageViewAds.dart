import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/empty_page.dart';
import '../../../image/view/image.dart';
import '../../model/home_model.dart';

class PageViewAds extends StatefulWidget {
  const PageViewAds(
      {Key? key, required this.adds, required this.pageViewController})
      : super(key: key);
  final List<AddsModel> adds;
  final PageController pageViewController;

  @override
  State<PageViewAds> createState() => _PageViewAdsState();
}

class _PageViewAdsState extends State<PageViewAds> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.32,
      child: widget.adds.isEmpty
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.black12,
              ),
              child: const  EmptyPage(content: "لا يوجد اعلانات")
            )
          : PageView.builder(
              itemCount: widget.adds.length,
              controller: widget.pageViewController,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => ShowImage(image: widget.adds[index].image),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.black12,
                        image: DecorationImage( 
                          image: NetworkImage(widget.adds[index].image),
                          fit: BoxFit.fill,
                          onError: (exception, stackTrace) {
                            if (kDebugMode) {
                              print(exception);
                            }
                          },
                        )),
                  ),
                );
              },
            ),
    );
  }
}
