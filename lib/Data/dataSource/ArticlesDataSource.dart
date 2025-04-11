import '../../models/ArticlesResponse/ArticleResponse.dart';

abstract class ArticlesDataSource {
  Future<ArticleResponse> getArticles(String source);
}