import 'package:injectable/injectable.dart';
import 'package:news_app/Data/Models/SourcesResponse/SourceResponse.dart';
import 'package:news_app/Data/dataSource/SourcesDataSource.dart';
import 'package:news_app/Repo/SourceRepo.dart';
@Injectable(as:SourceRepo )
class SourceRepoImpl extends SourceRepo {
  SourcesDataSource sourcesDataSource;
  @factoryMethod
  SourceRepoImpl(this.sourcesDataSource);
  @override
 Future <SourceResponse> getSources(String category,lang) {
    return sourcesDataSource.getSources(category,lang);
  }
}