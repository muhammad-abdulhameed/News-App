import 'package:injectable/injectable.dart';
import 'package:news_app/Data/Models/SourcesResponse/SourceResponse.dart';
import 'package:news_app/core/Remote/ApiHandler.dart';

import '../dataSource/SourcesDataSource.dart';
@Injectable(as: SourcesDataSource)
class SourcesApiDataSource extends SourcesDataSource {
  ApiManger apiManger;
  @factoryMethod
  SourcesApiDataSource(this.apiManger);
  @override
  Future<SourceResponse> getSources(String category,lang) {
  return  apiManger.getResources(category,lang);
  }
}