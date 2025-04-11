import '../Data/Models/SourcesResponse/SourceResponse.dart';

abstract  class SourceRepo {
  Future<SourceResponse> getSources(String category,lang);
}