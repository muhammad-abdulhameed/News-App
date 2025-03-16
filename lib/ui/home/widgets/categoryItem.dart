import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/mangers/colorsManger.dart';
import 'package:news_app/core/mangers/imageManger.dart';
import 'package:news_app/core/mangers/stringsManger.dart';
import 'package:news_app/models/categoryModel.dart';

class CategoryItem extends StatelessWidget {
   CategoryItem({super.key,required this.categoryModel,required this.onTapCategory});
  Function onTapCategory ;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:categoryModel.textDirection,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: REdgeInsetsDirectional.only(end: 8),
        height: 198.h,
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .onPrimary,
            borderRadius: BorderRadius.circular(24.r)
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(categoryModel.imageCategory,fit: BoxFit.fitWidth,width: 200,),
              Expanded(
                child: Padding(padding: REdgeInsets.symmetric(vertical: 30,),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          categoryModel.categoryName, style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge?.copyWith(fontSize: 27.5.sp)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),padding: EdgeInsets.zero

                          ),
                          onPressed: () {
                            onTapCategory(categoryModel);
                          }, child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: REdgeInsetsDirectional.only(start: 3),
                              child: Text(StringManger.viewAll,style: Theme.of(context).textTheme.bodyLarge,)),
                          CircleAvatar(radius: 30.r,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            child:  const Icon(Icons.arrow_forward_ios,color: Colors.black,),)
                        ],
                      )
                      )

                    ],),
                ),
              )
            ]),
      ),
    );
  }
}
