
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/providers/themeProvider.dart';
import 'package:news_app/ui/Search/Screen/Search_Screen.dart';
import 'package:news_app/ui/Search/Search_ViewModel.dart';
import 'package:news_app/ui/home/screen/home_screen.dart';
import 'package:news_app/ui/webView/Screen/FullArticle.dart';
import 'package:provider/provider.dart';
import 'core/Di/di.dart';
import 'core/appTheme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(EasyLocalization(
    supportedLocales: [Locale("ar"),Locale("en")],
    path: 'assets/translations',saveLocale: true,fallbackLocale:Locale("en") ,
    child: ChangeNotifierProvider(create: (BuildContext context) { return ThemeProvider(); },
    child: ChangeNotifierProvider(create: (context) => ThemeProvider(),
        child: MyApp())),
  ));
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
       supportedLocales: context.supportedLocales,
       localizationsDelegates: context.localizationDelegates,
       locale: context.locale,
       debugShowCheckedModeBanner: false,
       themeMode: provider.themeMode,
       theme: AppTheme.lightTheme,
       darkTheme:AppTheme.darkTheme ,
       routes: {
         HomeScreen.routeName:(_)=>HomeScreen(),
         FullArticle.routeName:(_)=>const FullArticle(),
         SearchScreen.routeName:(_)=>BlocProvider(create: (context) => getIt.get<SearchViewModel>(),
             child: const SearchScreen())
       },
       initialRoute: HomeScreen.routeName,
     ),
   );
 }
}