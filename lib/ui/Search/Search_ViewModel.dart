import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Data/repo_impl/SearchRepo_impl.dart';
import 'package:news_app/Repo/SearchArticlesRepo.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/models/ArticlesResponse/ArticleResponse.dart';

import '../../models/ArticlesResponse/Articles.dart';
@injectable
class SearchViewModel extends Cubit<SearchState>{
  SearchArticlesRepo searchArticlesRepo;

  SearchViewModel(this.searchArticlesRepo):super(LoadingState());
  getSearchedArticles(query) async{
    ArticleResponse searchedArticleResponse = await searchArticlesRepo.searchForArticle(query);
    try{
      if( searchedArticleResponse.status=="error"){////
        emit(ErrorState(searchedArticleResponse.message??""));
      }else if (searchedArticleResponse.articles?.isEmpty??true){
        emit(EmptyState());
      }else{
        emit(SuccessState(searchedArticleResponse.articles));
      }
    }catch(e){
      emit(ErrorState(searchedArticleResponse.message??""));
    }
  }
}
abstract class SearchState{}
class LoadingState extends SearchState{}
class ErrorState extends SearchState{
  String errorMassage;
  ErrorState(this. errorMassage );
}
class SuccessState extends SearchState{
  List<Article>? response;
  SuccessState(this .response);
}
class EmptyState extends SearchState{}
