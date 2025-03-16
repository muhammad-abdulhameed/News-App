import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/core/mangers/colorsManger.dart';
import 'package:news_app/core/mangers/imageManger.dart';
import 'package:news_app/core/mangers/stringsManger.dart';

import '../../../reusableComponats/customTextFormField.dart';
import '../../NewsList/widget/ArticleItem.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "SearchScreen";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
                padding: REdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: CustomTextFormField(
                  onChange: (){
                    setState(() {

                    });
                  },
                  prefixIcon: ImageManger.searchIcon,
                  controller: textEditingController,
                  hint: StringManger.search,
                )),
            Visibility(
              visible: textEditingController.text.isNotEmpty,
              child: FutureBuilder(
                future: ApiManger.searchForArticle(textEditingController.text.trim()),
                builder: (context, snapshot) {
                  var response = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManger.tertiary,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(response);
                    return Text("No Article Found");
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: REdgeInsets.all(16),
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              ArticleItem(articles: response!.articles![index]),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 16.h,
                          ),
                          itemCount: response?.articles?.length ?? 0,
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
