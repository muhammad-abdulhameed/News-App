import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Data/dataSource/ArticlesDataSource.dart';
import 'package:news_app/Data/dataSource_impl/ArticlesApiDataSource.dart';
import 'package:news_app/Data/repo_impl/ArticlesRepo_impl.dart';
import 'package:news_app/Repo/ArticlesRepo.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/models/ArticlesResponse/ArticleResponse.dart';
import 'package:news_app/models/ArticlesResponse/Articles.dart';
@injectable
class  ArticlesViewModel extends Cubit<NewsState>{
   ArticlesRepo articlesRepo;

  ArticlesViewModel(this.articlesRepo ):super(LoadingState());
  getArticles(String source)async{
try{
    ArticleResponse articleResponse=await articlesRepo.getArticles(source);
    if(articleResponse.status=="error"){
      emit(ErrorState(articleResponse.message??""));
    }else {
      if(articleResponse.articles?.isNotEmpty??false){
      emit(SuccessState(articleResponse.articles??[]));
    }else{
        emit(EmptyState());
      }
    }

  }catch(e){
  emit(ErrorState(e.toString()));
}
  }

}
interface class NewsState{}
class LoadingState extends NewsState{}
class ErrorState extends NewsState{
  String errorMessage;
  ErrorState(this.errorMessage);
}
class SuccessState extends NewsState{
  List<Article> articles;
  SuccessState(this.articles);
}
class EmptyState extends NewsState{
}