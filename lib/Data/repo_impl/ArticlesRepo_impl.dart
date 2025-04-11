import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Data/dataSource/ArticlesDataSource.dart';
import 'package:news_app/Repo/ArticlesRepo.dart';
import 'package:news_app/models/ArticlesResponse/ArticleResponse.dart';
@Injectable(as: ArticlesRepo)
class ArticlesRepo_impl implements ArticlesRepo{
   ArticlesDataSource articlesDataSource;
  @factoryMethod
  ArticlesRepo_impl(this.articlesDataSource);
  @override
  Future<ArticleResponse> getArticles(String source) {
  return  articlesDataSource.getArticles(source);

  }

}