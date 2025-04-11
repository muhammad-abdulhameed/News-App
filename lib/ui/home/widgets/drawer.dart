import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/mangers/colorsManger.dart';
import 'package:news_app/core/mangers/imageManger.dart';
import 'package:news_app/core/mangers/stringsManger.dart';
import 'package:news_app/core/providers/themeProvider.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/themeProvider.dart';

class AppDrawer extends StatefulWidget {
   AppDrawer({required this.onTapHome});
Function onTapHome;
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
late String selectedTheme='';

String selectedLang="";
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    context.locale.languageCode=="ar"?selectedLang=StringManger.arabic:selectedLang=StringManger.english;
    context.read<ThemeProvider>().themeMode==ThemeMode.light?selectedTheme=StringManger.light:selectedTheme=StringManger.dark;
}

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 166,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Text(
                StringManger.news,
                style: Theme.of(context).textTheme.bodyLarge,
              ).tr(),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
widget.onTapHome();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImageManger.homeIcon,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          StringManger.gotoHome,
                          style: Theme.of(context).textTheme.titleLarge,
                        ).tr()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Divider(
                    height: 2.h,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageManger.themeIcon,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        StringManger.theme,
                        style: Theme.of(context).textTheme.titleLarge,
                      ).tr()
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  InputDecorator(decoration: InputDecoration(isCollapsed: true,
                    enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(16.r,)),
                    contentPadding: REdgeInsets.all(5)

                  ),
                    child: DropdownButtonHideUnderline(

                      child: DropdownButton<String>(iconEnabledColor: Theme.of(context).colorScheme.primary,
                          isExpanded: true,dropdownColor: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(16.r),
                          hint: Text(selectedTheme,style: Theme.of(context).textTheme.titleLarge,).tr(),
                          padding: REdgeInsets.all(5),
                          items: [
                        DropdownMenuItem(
                          child: Text(StringManger.light).tr(),
                          value: "li",
                        ),
                        DropdownMenuItem(
                          child: Text(StringManger.dark).tr(),
                          value: "Dr",
                        )
                      ], onChanged: (item) {
                            setState(() {
                              if(item=="li"){
                                selectedTheme=StringManger.light.tr();
                                themeProvider.changeTheme(ThemeMode.light);
                              }else{
                                selectedTheme=StringManger.dark.tr();
                                themeProvider.changeTheme(ThemeMode.dark);
                              }
                            });
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Divider(
                    height: 2.h,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageManger.langIcon,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        StringManger.language,
                        style: Theme.of(context).textTheme.titleLarge,
                      ).tr()
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  InputDecorator(decoration: InputDecoration(isCollapsed: true,
                      enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(16.r,)),
                      contentPadding: REdgeInsets.all(5)

                  ),
                    child: DropdownButtonHideUnderline(

                      child: DropdownButton<String>(iconEnabledColor: Theme.of(context).colorScheme.primary,
                          isExpanded: true,dropdownColor: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(16.r),
                          hint: Text(selectedLang,style: Theme.of(context).textTheme.titleLarge,).tr(),
                          padding: REdgeInsets.all(5),
                          items: [
                            DropdownMenuItem(
                              child: Text(StringManger.english).tr(),
                              value: "en",
                            ),
                            DropdownMenuItem(
                              child: Text(StringManger.arabic).tr(),
                              value: "ar",
                            )
                          ], onChanged: (lang) {
                        setState(() {
                          if(lang=="ar"){
                           context.setLocale(Locale("ar"));
                            selectedLang=StringManger.arabic;
                          }else{
                            context.setLocale(Locale("en"));
                            selectedLang=StringManger.english;
                          }
                        });


                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
