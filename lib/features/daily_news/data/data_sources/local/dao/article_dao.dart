import 'package:floor/floor.dart';
import 'package:news_app_flutter/features/daily_news/data/models/article_dto.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleDTO articleDTO);

  @delete
  Future<void> deleteArticle(ArticleDTO articleDTO);

  @Query('SELECT * FROM article')
  Future<List<ArticleDTO>> getArticles();
}
