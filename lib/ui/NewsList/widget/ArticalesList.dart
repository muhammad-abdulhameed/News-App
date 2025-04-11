import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Di/di.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/core/mangers/colorsManger.dart';
import 'package:news_app/ui/NewsList/widget/Articales_ViewModel.dart';
import 'package:news_app/ui/NewsList/widget/ArticleItem.dart';

import '../../../models/ArticlesResponse/ArticleResponse.dart';
import '../../../Data/Models/SourcesResponse/Sources.dart';

class  ArticleList extends StatefulWidget {

Source source;
   ArticleList ({super.key,required this.source});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) =>  getIt.get<ArticlesViewModel>()..getArticles(widget.source.id??""),
      child: BlocBuilder<ArticlesViewModel,NewsState>(builder: (context, state) {
        if(state is LoadingState){
          return Center(child: CircularProgressIndicator(color: ColorManger.tertiary,));
        }else if(state is ErrorState){
           return Center(child: Column(
             children: [
               Text("${state.errorMessage}  "),
               ElevatedButton(onPressed: (){
                 setState(() {
                   
                 });
               }, child: Text("Try Again"))
             ],
           ));
        }else if(state is EmptyState)
        {
          return Center(child: Text ("No Articles Found"),);
        }

        else {
          var articlesList=(state as SuccessState).articles;
          return Padding(padding: REdgeInsets.all(16),
            child: ListView.separated(
              itemBuilder:(context, index) =>  ArticleItem(articles: articlesList[index]),
              separatorBuilder:(context, index) =>  SizedBox(height: 16.h,),
              itemCount: articlesList.length??0,),
          );
        }
      },),
    )


      /*FutureBuilder(future: ApiManger.getArticle( source.id??""),
        builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(color: ColorManger.tertiary,));
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
    );*/;

  }
}
