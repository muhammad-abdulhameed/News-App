import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/mangers/colorsManger.dart';
import 'package:news_app/core/mangers/imageManger.dart';
import 'package:news_app/core/mangers/stringsManger.dart';
import 'package:news_app/models/categoryModel.dart';

import 'categoryItem.dart';

class CategoryWidget extends StatelessWidget {
   Function onTapCategoryWidget;
   CategoryWidget({super.key,required this.onTapCategoryWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            StringManger.welcomeText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CategoryItem(
                    categoryModel: CategoryModel.categoryList[index], onTapCategory: onTapCategoryWidget,),
                separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                itemCount: CategoryModel.categoryList.length),
          ),
        ],
      ),
    );
  }
}
