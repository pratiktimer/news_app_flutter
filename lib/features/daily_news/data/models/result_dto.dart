import 'package:news_app_flutter/features/daily_news/data/models/article_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_dto.g.dart';

@JsonSerializable()
class ResultDTO {
  String status;
  int totalResults;
  List<ArticleDTO> articles;

  ResultDTO(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory ResultDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ResultDTOToJson(this);
}
