import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app_flutter/core/constants/constants.dart';
import 'package:news_app_flutter/core/resources/data_state.dart';
import 'package:news_app_flutter/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_flutter/features/daily_news/data/models/article_dto.dart';
import 'package:news_app_flutter/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleDTO>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      } else {
        print(httpResponse.response.statusMessage);
        return DataFailed(DioException(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
        ));
      }
    } on DioException catch (e) {
      print(e.message);
      return DataFailed(e);
    }
  }
}
