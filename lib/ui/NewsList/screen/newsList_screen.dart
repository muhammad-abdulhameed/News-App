import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/Di/di.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/ui/NewsList/screen/newsList_viewModel.dart';
import 'package:news_app/ui/NewsList/widget/ArticalesList.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key ,required this.categoryModel});
final CategoryModel ?categoryModel;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}


class _NewsScreenState extends State<NewsScreen> {
 late String local;
late NewsListViewModel _viewModel;
@override
  void initState() {
  _viewModel = getIt.get<NewsListViewModel>();
    super.initState();
  }
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();

   local= context.locale.languageCode;

    _viewModel.getResources(widget.categoryModel?.id ?? "", local);///this step to re request api when local change cause
///did dep is recall when dependency change (locale)the make new request with new locale
  }
  @override
  Widget build(BuildContext context) {
    ///value constructor make you use exist obj inherit from change notifier (we already init it in initState )
    return ChangeNotifierProvider<NewsListViewModel>.value(/*create:(context) =>  getIt.get<NewsListViewModel>()..getResources(widget.categoryModel?.id??"",local),*/
      value: _viewModel,
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
                    tabs: value.sources!.map((sources) => Tab(text: sources?.name)).toList(),
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
