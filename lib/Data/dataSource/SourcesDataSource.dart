import 'package:news_app/Data/Models/SourcesResponse/SourceResponse.dart';

abstract class SourcesDataSource{
Future<SourceResponse> getSources(String category,lang);
}