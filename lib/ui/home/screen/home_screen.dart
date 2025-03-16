import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/mangers/colorsManger.dart';
import 'package:news_app/core/mangers/stringsManger.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/ui/NewsList/screen/newsList_screen.dart';
import 'package:news_app/ui/Search/Screen/Search_Screen.dart';
import 'package:news_app/ui/home/widgets/catagoryWidget.dart';
import 'package:news_app/ui/home/widgets/categoryItem.dart';
import 'package:news_app/ui/home/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
bool isCategorySelected=false;
CategoryModel ?categoryModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(onTapHome: (){
          setState(() {
            isCategorySelected=false;
            categoryModel=null;
            Navigator.pop(context);
          });
        },),
        appBar: AppBar(
          title: Text(categoryModel?.categoryName??StringManger.home),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
             icon: const Icon(Icons.search,),
              color: Theme.of(context).colorScheme.onPrimary,
            )
          ],
        ),
        body: isCategorySelected?NewsScreen(categoryModel: categoryModel,) : CategoryWidget(onTapCategoryWidget: changeBody,)
      ),
    );
  }

  changeBody(CategoryModel selectedCategoryModel){
    isCategorySelected=true;
    categoryModel=selectedCategoryModel;
    setState(() {

      
    });
  }
}
