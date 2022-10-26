// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieModel _$$_MovieModelFromJson(Map<String, dynamic> json) =>
    _$_MovieModel(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      rated: json['Rated'] as String?,
      released: json['Released'] as String?,
      runtime: json['Runtime'] as String?,
      genre: json['Genre'] as String?,
      director: json['Director'] as String?,
      writer: json['Writer'] as String?,
      actors: json['Actors'] as String?,
      plot: json['Plot'] as String?,
      language: json['Language'] as String?,
      country: json['Country'] as String?,
      poster: json['Poster'] as String?,
      imdbID: json['imdbID'] as String?,
    );

Map<String, dynamic> _$$_MovieModelToJson(_$_MovieModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Title', instance.title);
  writeNotNull('Year', instance.year);
  writeNotNull('Rated', instance.rated);
  writeNotNull('Released', instance.released);
  writeNotNull('Runtime', instance.runtime);
  writeNotNull('Genre', instance.genre);
  writeNotNull('Director', instance.director);
  writeNotNull('Writer', instance.writer);
  writeNotNull('Actors', instance.actors);
  writeNotNull('Plot', instance.plot);
  writeNotNull('Language', instance.language);
  writeNotNull('Country', instance.country);
  writeNotNull('Poster', instance.poster);
  writeNotNull('imdbID', instance.imdbID);
  return val;
}
