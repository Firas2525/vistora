
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/empty_page.dart';
import '../../model/home_model.dart';
import 'GridViewCategoriesItem.dart';

class CustomCategories extends StatefulWidget {
  const CustomCategories(
      {Key? key, required this.categories, required this.function})
      : super(key: key);
  final List<CategoryModel> categories;
  final Function(CategoryModel) function;

  @override
  State<CustomCategories> createState() => _CustomCategoriesState();
}

class _CustomCategoriesState extends State<CustomCategories> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return widget.categories.isEmpty
        ? const EmptyPage(content: "لا يوجد أقسام")
        : SizedBox(
            height: height * 0.24,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  focusColor: AppColors.white,
                  highlightColor: AppColors.white,
                  splashColor: AppColors.white,
                  onTap: () {
                    widget.function(widget.categories[index]);
                  },
                  child: GridViewCategoriesItem(
                      title: widget.categories[index].name,
                      image: widget.categories[index].image,
                      selected: widget.categories[index].selected),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            ));
  }
}
