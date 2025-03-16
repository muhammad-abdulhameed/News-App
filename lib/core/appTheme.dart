import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/mangers/colorsManger.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: ColorManger.lightPrimary,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.darkPrimary),
          elevation: 0),
      drawerTheme: DrawerThemeData(
        backgroundColor: ColorManger.darkPrimary,
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(overflow: TextOverflow.ellipsis,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.darkPrimary),
          bodyMedium: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500,fontSize: 16.sp,color: ColorManger.darkPrimary),
          titleLarge: TextStyle(overflow: TextOverflow.ellipsis,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.lightPrimary)
     , bodySmall:TextStyle(overflow: TextOverflow.ellipsis,fontSize: 12.sp,fontWeight: FontWeight.w500,color:ColorManger.tertiary )
      ),
      colorScheme: ColorScheme.light(

          primary: ColorManger.lightPrimary, onPrimary: ColorManger.darkPrimary));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorManger.darkPrimary,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.lightPrimary),
          elevation: 0),
      drawerTheme: DrawerThemeData(
        backgroundColor: ColorManger.lightPrimary,
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
            overflow: TextOverflow.ellipsis,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.lightPrimary),
          bodyMedium: TextStyle(
              overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500,fontSize: 16.sp,color: ColorManger.lightPrimary),
          titleLarge: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.lightPrimary)
          , bodySmall:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color:ColorManger.tertiary )
      ),
      colorScheme: ColorScheme.dark(

          primary: ColorManger.darkPrimary, onPrimary: ColorManger.lightPrimary));
}
