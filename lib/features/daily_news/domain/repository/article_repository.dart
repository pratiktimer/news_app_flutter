import 'package:news_app_flutter/core/resources/data_state.dart';
import 'package:news_app_flutter/features/daily_news/data/models/article_dto.dart';
import 'package:news_app_flutter/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API Methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

// Database methods
  Future<List<ArticleDTO>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
