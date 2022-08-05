import '../../data/models/movie_model.dart';

class MovieEntity extends MovieModel {
  const MovieEntity({
    super.title,
    super.year,
    super.rated,
    super.released,
    super.runtime,
    super.genre,
    super.director,
    super.writer,
    super.actors,
    super.plot,
    super.language,
    super.country,
    super.poster,
    super.imdbID,
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
}
