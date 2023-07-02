import 'package:floor/floor.dart';
import 'package:news_app_flutter/features/daily_news/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';
part 'article_dto.g.dart';

@JsonSerializable()
@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleDTO extends ArticleEntity {
  const ArticleDTO({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleDTO.fromJson(Map<String, dynamic> json) =>
      _$ArticleDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDTOToJson(this);

  factory ArticleDTO.fromEntity(ArticleEntity entity) {
    return ArticleDTO(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content);
  }
}
