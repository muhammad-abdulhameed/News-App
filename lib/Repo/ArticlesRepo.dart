import 'package:news_app/models/ArticlesResponse/ArticleResponse.dart';

abstract class ArticlesRepo{
 Future<ArticleResponse> getArticles(String source);
}