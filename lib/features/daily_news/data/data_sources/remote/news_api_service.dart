import 'package:news_app_flutter/features/daily_news/data/models/result_dto.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<ResultDTO>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}