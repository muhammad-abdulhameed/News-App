import 'package:injectable/injectable.dart';
import 'package:news_app/Data/dataSource/ArticlesDataSource.dart';
import 'package:news_app/Data/dataSource_impl/SearchForArticleDataSource_impl.dart';
import 'package:news_app/models/ArticlesResponse/ArticleResponse.dart';

import '../../Repo/SearchArticlesRepo.dart';
import '../dataSource/SearchForArticleDataSource.dart';
@Injectable(as: SearchArticlesRepo)
class SearchArticlesRepoImpl implements SearchArticlesRepo{
  SearchForArticleDataSource articlesDataSource;
  @factoryMethod
  SearchArticlesRepoImpl(this.articlesDataSource);
  @override
  Future<ArticleResponse> searchForArticle(String query) {
return   articlesDataSource.searchForArticles(query);

  }
}