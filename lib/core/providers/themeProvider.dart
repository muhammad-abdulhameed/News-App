import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
 ThemeMode? themeMode=ThemeMode.light;
 void changeTheme(ThemeMode newThemeMode){
  themeMode=newThemeMode;
  notifyListeners();
}

}