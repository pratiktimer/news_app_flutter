import 'package:news_app_flutter/features/daily_news/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_dto.g.dart';

@JsonSerializable()
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
}
