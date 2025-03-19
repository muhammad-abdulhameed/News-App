import 'package:flutter/material.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/ui/NewsList/screen/newsList_viewModel.dart';
import 'package:news_app/ui/NewsList/widget/ArticalesList.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key ,required this.categoryModel});
CategoryModel ?categoryModel;


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) =>  NewsListViewModel()..getResources(categoryModel?.id??""),
      child: Consumer<NewsListViewModel>(builder: (context, value, child) {
        if(value.isLoading){
          return const Center(child: CircularProgressIndicator(color: Colors.grey,));
        }else if(value.errorMessage?.isNotEmpty??false){
           return Center(child: Text(value.errorMessage.toString()),);
        }else if(value.sources?.isEmpty??true){
          return Center(child: Text("There's No Articles"),);
        }else{
          return
            DefaultTabController(
              length: value.sources?.length??0,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    unselectedLabelStyle: TextStyle(fontSize: 14,color: Colors.black),
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    indicatorColor: Theme.of(context).colorScheme.onPrimary,labelColor: Colors.black,
                    tabs: value.sources!.map((sources) => Tab(text: sources.name)).toList(),
                  ),
                  Expanded(
                      child: TabBarView(
                          children: value.sources!.map((e) => ArticleList(source: e,)).toList()))
                ],
              ),
            );
        }
      },),
      )
      /*FutureBuilder(
        future: ApiManger.getResources(categoryModel?.id??""),
        builder: (context, snapshot) {
          var response= snapshot.data?.sources;
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.grey,));
          }else if(snapshot.hasError){
            return Text(snapshot.error.toString()??"");

          }else if(response?.isEmpty??true){
          return  Center(child: Text("No Articales"),);
           }
          else{
            return
            DefaultTabController(
      length: response?.length??0,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            unselectedLabelStyle: TextStyle(fontSize: 14,color: Colors.black),
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            indicatorColor: Theme.of(context).colorScheme.onPrimary,labelColor: Colors.black,
            tabs: response!.map((sources) => Tab(text: sources.name)).toList(),
          ),
          Expanded(
              child: TabBarView(
                  children: snapshot.data!.sources!.map((e) => ArticleList(source: e,)).toList()))
        ],
      ),
    );
          }
        },
    )*/;

  }
}
