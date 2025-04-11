import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Repo/SourceRepo.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/Data/Models/SourcesResponse/Sources.dart';
@injectable
class NewsListViewModel extends ChangeNotifier {
  bool isLoading=false;
  String? errorMessage;
  List<Source>? sources;
  SourceRepo sourceRepo;
  NewsListViewModel(this.sourceRepo);
  getResources(String category,lang)async{
    try{
    isLoading=true;
    var response=await sourceRepo.getSources(category,lang);
    isLoading=false;
    if(response.status=="error"){
      errorMessage=response.message;
    }else if(response.sources?.isNotEmpty??false){
      sources=response.sources;
    }
  notifyListeners();
  }catch(e){
      errorMessage=e.toString();
    }
  }

}