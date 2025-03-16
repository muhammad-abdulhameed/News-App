
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/providers/themeProvider.dart';
import 'package:news_app/ui/Search/Screen/Search_Screen.dart';
import 'package:news_app/ui/home/screen/home_screen.dart';
import 'package:news_app/ui/webView/Screen/FullArticle.dart';
import 'package:provider/provider.dart';
import 'core/appTheme.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(create: (BuildContext context) { return ThemeProvider(); },
  child: ChangeNotifierProvider(create: (context) => ThemeProvider(),
      child: MyApp())));
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

 @override
 Widget build(BuildContext context ){
   ThemeProvider provider =Provider.of<ThemeProvider>(context);
   return ScreenUtilInit(
     designSize: const Size(393, 852),
     minTextAdapt: true,
     splitScreenMode: true,
     builder: (context, child) => MaterialApp(
       debugShowCheckedModeBanner: false,
       themeMode: provider.themeMode,
       theme: AppTheme.lightTheme,
       darkTheme:AppTheme.darkTheme ,
       routes: {
         HomeScreen.routeName:(_)=>HomeScreen(),
         FullArticle.routeName:(_)=>FullArticle(),
         SearchScreen.routeName:(_)=>SearchScreen()
       },
       initialRoute: HomeScreen.routeName,
     ),
   );
 }
}