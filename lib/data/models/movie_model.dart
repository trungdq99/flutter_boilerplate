import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Equatable {
  @JsonKey(name: 'Title', includeIfNull: false)
  final String? title;

  @JsonKey(name: 'Year', includeIfNull: false)
  final String? year;

  @JsonKey(name: 'Rated', includeIfNull: false)
  final String? rated;

  @JsonKey(name: 'Released', includeIfNull: false)
  final String? released;

  @JsonKey(name: 'Runtime', includeIfNull: false)
  final String? runtime;

  @JsonKey(name: 'Genre', includeIfNull: false)
  final String? genre;

  @JsonKey(name: 'Director', includeIfNull: false)
  final String? director;

  @JsonKey(name: 'Writer', includeIfNull: false)
  final String? writer;

  @JsonKey(name: 'Actors', includeIfNull: false)
  final String? actors;

  @JsonKey(name: 'Plot', includeIfNull: false)
  final String? plot;

  @JsonKey(name: 'Language', includeIfNull: false)
  final String? language;

  @JsonKey(name: 'Country', includeIfNull: false)
  final String? country;

  @JsonKey(name: 'Poster', includeIfNull: false)
  final String? poster;

  @JsonKey(name: 'imdbID', includeIfNull: false)
  final String? imdbID;

  const MovieModel({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.poster,
    this.imdbID,
  });

  MovieModel copyWith({
    String? title,
    String? year,
    String? rated,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? country,
    String? poster,
    String? imdbID,
  }) =>
      MovieModel(
        title: title ?? this.title,
        year: year ?? this.year,
        rated: rated ?? this.rated,
        released: released ?? this.released,
        runtime: runtime ?? this.runtime,
        genre: genre ?? this.genre,
        director: director ?? this.director,
        writer: writer ?? this.writer,
        actors: actors ?? this.actors,
        plot: plot ?? this.plot,
        language: language ?? this.language,
        country: country ?? this.country,
        poster: poster ?? this.poster,
        imdbID: imdbID ?? this.imdbID,
      );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  List<Object?> get props => [
        title,
        year,
        rated,
        released,
        runtime,
        genre,
        director,
        writer,
        actors,
        plot,
        language,
        country,
        poster,
        imdbID,
      ];
}
