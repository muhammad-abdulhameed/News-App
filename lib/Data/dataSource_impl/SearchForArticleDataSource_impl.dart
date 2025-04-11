import 'package:injectable/injectable.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/models/ArticlesResponse/ArticleResponse.dart';

import '../dataSource/SearchForArticleDataSource.dart';
@Injectable(as: SearchForArticleDataSource)
class SearchForArticleDataSourceImpl implements SearchForArticleDataSource {
  ApiManger apiManger;
  @factoryMethod
  SearchForArticleDataSourceImpl(this.apiManger);
  @override
  Future<ArticleResponse>searchForArticles(query)  {
   return  apiManger.searchForArticle(query);
  }

}