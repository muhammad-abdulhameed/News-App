import '../../models/ArticlesResponse/ArticleResponse.dart';

abstract class SearchForArticleDataSource{
  Future<ArticleResponse> searchForArticles(query);

}