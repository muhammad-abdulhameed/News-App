// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../Data/dataSource/ArticlesDataSource.dart' as _i4;
import '../../Data/dataSource/SearchForArticleDataSource.dart' as _i9;
import '../../Data/dataSource/SourcesDataSource.dart' as _i11;
import '../../Data/dataSource_impl/ArticlesApiDataSource.dart' as _i5;
import '../../Data/dataSource_impl/SearchForArticleDataSource_impl.dart'
    as _i10;
import '../../Data/dataSource_impl/SourcesApiDataSource.dart' as _i12;
import '../../Data/repo_impl/ArticlesRepo_impl.dart' as _i7;
import '../../Data/repo_impl/SearchRepo_impl.dart' as _i14;
import '../../Data/repo_impl/SourceRepo_Impl.dart' as _i17;
import '../../Repo/ArticlesRepo.dart' as _i6;
import '../../Repo/SearchArticlesRepo.dart' as _i13;
import '../../Repo/SourceRepo.dart' as _i16;
import '../../ui/NewsList/screen/newsList_viewModel.dart' as _i18;
import '../../ui/NewsList/widget/Articales_ViewModel.dart' as _i8;
import '../../ui/Search/Search_ViewModel.dart' as _i15;
import '../Remote/ApiHandler.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(() => _i3.ApiManger());
    gh.factory<_i4.ArticlesDataSource>(
        () => _i5.ArticlesApiDataSource(gh<_i3.ApiManger>()));
    gh.factory<_i6.ArticlesRepo>(
        () => _i7.ArticlesRepo_impl(gh<_i4.ArticlesDataSource>()));
    gh.factory<_i8.ArticlesViewModel>(
        () => _i8.ArticlesViewModel(gh<_i6.ArticlesRepo>()));
    gh.factory<_i9.SearchForArticleDataSource>(
        () => _i10.SearchForArticleDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i11.SourcesDataSource>(
        () => _i12.SourcesApiDataSource(gh<_i3.ApiManger>()));
    gh.factory<_i13.SearchArticlesRepo>(() =>
        _i14.SearchArticlesRepoImpl(gh<_i9.SearchForArticleDataSource>()));
    gh.factory<_i15.SearchViewModel>(
        () => _i15.SearchViewModel(gh<_i13.SearchArticlesRepo>()));
    gh.factory<_i16.SourceRepo>(
        () => _i17.SourceRepoImpl(gh<_i11.SourcesDataSource>()));
    gh.factory<_i18.NewsListViewModel>(
        () => _i18.NewsListViewModel(gh<_i16.SourceRepo>()));
    return this;
  }
}
