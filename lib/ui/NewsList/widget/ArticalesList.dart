import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/core/mangers/colorsManger.dart';
import 'package:news_app/ui/NewsList/widget/ArticleItem.dart';

import '../../../models/ArticlesResponse/ArticleResponse.dart';
import '../../../models/SourcesResponse/Sources.dart';

class  ArticleList extends StatelessWidget {

Source source;
   ArticleList ({super.key,required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManger.getArticle( source.id??""),
        builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return CircularProgressIndicator(color: ColorManger.tertiary,);
      }
      else if(snapshot.hasError){
        return Center(child: Text(snapshot.error.toString()),);
      }
          return Padding(padding: REdgeInsets.all(16),
            child: ListView.separated(
              itemBuilder:(context, index) =>  ArticleItem(articles: snapshot.data!.articles![index]),
              separatorBuilder:(context, index) =>  SizedBox(height: 16.h,),
              itemCount: snapshot.data?.articles?.length??0,),
          );
        },
    );

  }
}
