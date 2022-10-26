import 'package:equatable/equatable.dart';

import '../../data/models/movie_model.dart';

class MovieEntity extends Equatable {
  final String? title;
  final String? year;
  final String? rated;
  final String? released;
  final String? runtime;
  final String? genre;
  final String? director;
  final String? writer;
  final String? actors;
  final String? plot;
  final String? language;
  final String? country;
  final String? poster;
  final String? imdbID;

  const MovieEntity({
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
  factory MovieEntity.fromModel(MovieModel model) => MovieEntity(
        title: model.title,
        year: model.year,
        rated: model.rated,
        released: model.released,
        runtime: model.runtime,
        genre: model.genre,
        director: model.director,
        writer: model.writer,
        actors: model.actors,
        plot: model.plot,
        language: model.language,
        country: model.country,
        poster: model.poster,
        imdbID: model.imdbID,
      );

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
