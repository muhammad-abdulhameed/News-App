import 'dart:ui';

import 'package:news_app/core/mangers/imageManger.dart';
import 'package:news_app/core/mangers/stringsManger.dart';

class CategoryModel{
  String id;
  String categoryName;
  String imageCategory;
  TextDirection textDirection;
  CategoryModel({required this.id,required this.categoryName,required this.imageCategory,this.textDirection=TextDirection.ltr});
  static List<CategoryModel>categoryList =[
    CategoryModel(id: "general", categoryName: StringManger.general, imageCategory: ImageManger.generalImage),
    CategoryModel(id: "business", categoryName: StringManger.business, imageCategory: ImageManger.business,textDirection: TextDirection.rtl),
    CategoryModel(id: "sports", categoryName: StringManger.sport, imageCategory: ImageManger.sport),
    CategoryModel(id: "technology", categoryName: StringManger.technology, imageCategory: ImageManger.technology,textDirection: TextDirection.rtl),
    CategoryModel(id: "health", categoryName: StringManger.health, imageCategory: ImageManger.health),

    CategoryModel(id: "science", categoryName: StringManger.science, imageCategory: ImageManger.since,textDirection: TextDirection.rtl),
    CategoryModel(id: "entertainment", categoryName: StringManger.entertainment, imageCategory: ImageManger.entertainment,),
  ];
}