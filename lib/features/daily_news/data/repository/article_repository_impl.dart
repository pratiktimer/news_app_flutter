import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app_flutter/core/constants/constants.dart';
import 'package:news_app_flutter/core/resources/data_state.dart';
import 'package:news_app_flutter/features/daily_news/data/data_sources/local/dao/app_database.dart';
import 'package:news_app_flutter/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_flutter/features/daily_news/data/models/article_dto.dart';
import 'package:news_app_flutter/features/daily_news/domain/entities/article.dart';
import 'package:news_app_flutter/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._appDatabase, this._newsApiService);

  @override
  Future<DataState<List<ArticleDTO>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      } else {
        return DataFailed(DioException(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleDTO>> getSavedArticles() {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleDTO.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleDTO.fromEntity(article));
  }
}
