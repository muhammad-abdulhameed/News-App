import 'package:injectable/injectable.dart';
import 'package:news_app/Data/dataSource/ArticlesDataSource.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';
import 'package:news_app/models/ArticlesResponse/ArticleResponse.dart';
@Injectable(as: ArticlesDataSource)
class ArticlesApiDataSource implements ArticlesDataSource{
  ApiManger apiManger;
  @factoryMethod
  ArticlesApiDataSource(this.apiManger);

  @override
  Future<ArticleResponse> getArticles(String source) {
    return apiManger.getArticle(source);
  }
}
