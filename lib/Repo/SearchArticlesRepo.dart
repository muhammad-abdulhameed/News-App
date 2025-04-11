import '../models/ArticlesResponse/ArticleResponse.dart';

abstract class SearchArticlesRepo{
  Future <ArticleResponse> searchForArticle(String query);
}