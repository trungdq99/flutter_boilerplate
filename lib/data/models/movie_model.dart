// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.g.dart';
part 'movie_model.freezed.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    @JsonKey(name: 'Title', includeIfNull: false) String? title,
    @JsonKey(name: 'Year', includeIfNull: false) String? year,
    @JsonKey(name: 'Rated', includeIfNull: false) String? rated,
    @JsonKey(name: 'Released', includeIfNull: false) String? released,
    @JsonKey(name: 'Runtime', includeIfNull: false) String? runtime,
    @JsonKey(name: 'Genre', includeIfNull: false) String? genre,
    @JsonKey(name: 'Director', includeIfNull: false) String? director,
    @JsonKey(name: 'Writer', includeIfNull: false) String? writer,
    @JsonKey(name: 'Actors', includeIfNull: false) String? actors,
    @JsonKey(name: 'Plot', includeIfNull: false) String? plot,
    @JsonKey(name: 'Language', includeIfNull: false) String? language,
    @JsonKey(name: 'Country', includeIfNull: false) String? country,
    @JsonKey(name: 'Poster', includeIfNull: false) String? poster,
    @JsonKey(name: 'imdbID', includeIfNull: false) String? imdbID,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
