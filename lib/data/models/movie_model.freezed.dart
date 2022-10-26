// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return _MovieModel.fromJson(json);
}

/// @nodoc
mixin _$MovieModel {
  @JsonKey(name: 'Title', includeIfNull: false)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year', includeIfNull: false)
  String? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rated', includeIfNull: false)
  String? get rated => throw _privateConstructorUsedError;
  @JsonKey(name: 'Released', includeIfNull: false)
  String? get released => throw _privateConstructorUsedError;
  @JsonKey(name: 'Runtime', includeIfNull: false)
  String? get runtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Genre', includeIfNull: false)
  String? get genre => throw _privateConstructorUsedError;
  @JsonKey(name: 'Director', includeIfNull: false)
  String? get director => throw _privateConstructorUsedError;
  @JsonKey(name: 'Writer', includeIfNull: false)
  String? get writer => throw _privateConstructorUsedError;
  @JsonKey(name: 'Actors', includeIfNull: false)
  String? get actors => throw _privateConstructorUsedError;
  @JsonKey(name: 'Plot', includeIfNull: false)
  String? get plot => throw _privateConstructorUsedError;
  @JsonKey(name: 'Language', includeIfNull: false)
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'Country', includeIfNull: false)
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'Poster', includeIfNull: false)
  String? get poster => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdbID', includeIfNull: false)
  String? get imdbID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieModelCopyWith<MovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieModelCopyWith<$Res> {
  factory $MovieModelCopyWith(
          MovieModel value, $Res Function(MovieModel) then) =
      _$MovieModelCopyWithImpl<$Res, MovieModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Title', includeIfNull: false) String? title,
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
      @JsonKey(name: 'imdbID', includeIfNull: false) String? imdbID});
}

/// @nodoc
class _$MovieModelCopyWithImpl<$Res, $Val extends MovieModel>
    implements $MovieModelCopyWith<$Res> {
  _$MovieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? year = freezed,
    Object? rated = freezed,
    Object? released = freezed,
    Object? runtime = freezed,
    Object? genre = freezed,
    Object? director = freezed,
    Object? writer = freezed,
    Object? actors = freezed,
    Object? plot = freezed,
    Object? language = freezed,
    Object? country = freezed,
    Object? poster = freezed,
    Object? imdbID = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as String?,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      writer: freezed == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as String?,
      actors: freezed == actors
          ? _value.actors
          : actors // ignore: cast_nullable_to_non_nullable
              as String?,
      plot: freezed == plot
          ? _value.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbID: freezed == imdbID
          ? _value.imdbID
          : imdbID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieModelCopyWith<$Res>
    implements $MovieModelCopyWith<$Res> {
  factory _$$_MovieModelCopyWith(
          _$_MovieModel value, $Res Function(_$_MovieModel) then) =
      __$$_MovieModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Title', includeIfNull: false) String? title,
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
      @JsonKey(name: 'imdbID', includeIfNull: false) String? imdbID});
}

/// @nodoc
class __$$_MovieModelCopyWithImpl<$Res>
    extends _$MovieModelCopyWithImpl<$Res, _$_MovieModel>
    implements _$$_MovieModelCopyWith<$Res> {
  __$$_MovieModelCopyWithImpl(
      _$_MovieModel _value, $Res Function(_$_MovieModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? year = freezed,
    Object? rated = freezed,
    Object? released = freezed,
    Object? runtime = freezed,
    Object? genre = freezed,
    Object? director = freezed,
    Object? writer = freezed,
    Object? actors = freezed,
    Object? plot = freezed,
    Object? language = freezed,
    Object? country = freezed,
    Object? poster = freezed,
    Object? imdbID = freezed,
  }) {
    return _then(_$_MovieModel(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as String?,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      writer: freezed == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as String?,
      actors: freezed == actors
          ? _value.actors
          : actors // ignore: cast_nullable_to_non_nullable
              as String?,
      plot: freezed == plot
          ? _value.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbID: freezed == imdbID
          ? _value.imdbID
          : imdbID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieModel implements _MovieModel {
  _$_MovieModel(
      {@JsonKey(name: 'Title', includeIfNull: false) this.title,
      @JsonKey(name: 'Year', includeIfNull: false) this.year,
      @JsonKey(name: 'Rated', includeIfNull: false) this.rated,
      @JsonKey(name: 'Released', includeIfNull: false) this.released,
      @JsonKey(name: 'Runtime', includeIfNull: false) this.runtime,
      @JsonKey(name: 'Genre', includeIfNull: false) this.genre,
      @JsonKey(name: 'Director', includeIfNull: false) this.director,
      @JsonKey(name: 'Writer', includeIfNull: false) this.writer,
      @JsonKey(name: 'Actors', includeIfNull: false) this.actors,
      @JsonKey(name: 'Plot', includeIfNull: false) this.plot,
      @JsonKey(name: 'Language', includeIfNull: false) this.language,
      @JsonKey(name: 'Country', includeIfNull: false) this.country,
      @JsonKey(name: 'Poster', includeIfNull: false) this.poster,
      @JsonKey(name: 'imdbID', includeIfNull: false) this.imdbID});

  factory _$_MovieModel.fromJson(Map<String, dynamic> json) =>
      _$$_MovieModelFromJson(json);

  @override
  @JsonKey(name: 'Title', includeIfNull: false)
  final String? title;
  @override
  @JsonKey(name: 'Year', includeIfNull: false)
  final String? year;
  @override
  @JsonKey(name: 'Rated', includeIfNull: false)
  final String? rated;
  @override
  @JsonKey(name: 'Released', includeIfNull: false)
  final String? released;
  @override
  @JsonKey(name: 'Runtime', includeIfNull: false)
  final String? runtime;
  @override
  @JsonKey(name: 'Genre', includeIfNull: false)
  final String? genre;
  @override
  @JsonKey(name: 'Director', includeIfNull: false)
  final String? director;
  @override
  @JsonKey(name: 'Writer', includeIfNull: false)
  final String? writer;
  @override
  @JsonKey(name: 'Actors', includeIfNull: false)
  final String? actors;
  @override
  @JsonKey(name: 'Plot', includeIfNull: false)
  final String? plot;
  @override
  @JsonKey(name: 'Language', includeIfNull: false)
  final String? language;
  @override
  @JsonKey(name: 'Country', includeIfNull: false)
  final String? country;
  @override
  @JsonKey(name: 'Poster', includeIfNull: false)
  final String? poster;
  @override
  @JsonKey(name: 'imdbID', includeIfNull: false)
  final String? imdbID;

  @override
  String toString() {
    return 'MovieModel(title: $title, year: $year, rated: $rated, released: $released, runtime: $runtime, genre: $genre, director: $director, writer: $writer, actors: $actors, plot: $plot, language: $language, country: $country, poster: $poster, imdbID: $imdbID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.rated, rated) || other.rated == rated) &&
            (identical(other.released, released) ||
                other.released == released) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.director, director) ||
                other.director == director) &&
            (identical(other.writer, writer) || other.writer == writer) &&
            (identical(other.actors, actors) || other.actors == actors) &&
            (identical(other.plot, plot) || other.plot == plot) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.imdbID, imdbID) || other.imdbID == imdbID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      imdbID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieModelCopyWith<_$_MovieModel> get copyWith =>
      __$$_MovieModelCopyWithImpl<_$_MovieModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieModelToJson(
      this,
    );
  }
}

abstract class _MovieModel implements MovieModel {
  factory _MovieModel(
      {@JsonKey(name: 'Title', includeIfNull: false)
          final String? title,
      @JsonKey(name: 'Year', includeIfNull: false)
          final String? year,
      @JsonKey(name: 'Rated', includeIfNull: false)
          final String? rated,
      @JsonKey(name: 'Released', includeIfNull: false)
          final String? released,
      @JsonKey(name: 'Runtime', includeIfNull: false)
          final String? runtime,
      @JsonKey(name: 'Genre', includeIfNull: false)
          final String? genre,
      @JsonKey(name: 'Director', includeIfNull: false)
          final String? director,
      @JsonKey(name: 'Writer', includeIfNull: false)
          final String? writer,
      @JsonKey(name: 'Actors', includeIfNull: false)
          final String? actors,
      @JsonKey(name: 'Plot', includeIfNull: false)
          final String? plot,
      @JsonKey(name: 'Language', includeIfNull: false)
          final String? language,
      @JsonKey(name: 'Country', includeIfNull: false)
          final String? country,
      @JsonKey(name: 'Poster', includeIfNull: false)
          final String? poster,
      @JsonKey(name: 'imdbID', includeIfNull: false)
          final String? imdbID}) = _$_MovieModel;

  factory _MovieModel.fromJson(Map<String, dynamic> json) =
      _$_MovieModel.fromJson;

  @override
  @JsonKey(name: 'Title', includeIfNull: false)
  String? get title;
  @override
  @JsonKey(name: 'Year', includeIfNull: false)
  String? get year;
  @override
  @JsonKey(name: 'Rated', includeIfNull: false)
  String? get rated;
  @override
  @JsonKey(name: 'Released', includeIfNull: false)
  String? get released;
  @override
  @JsonKey(name: 'Runtime', includeIfNull: false)
  String? get runtime;
  @override
  @JsonKey(name: 'Genre', includeIfNull: false)
  String? get genre;
  @override
  @JsonKey(name: 'Director', includeIfNull: false)
  String? get director;
  @override
  @JsonKey(name: 'Writer', includeIfNull: false)
  String? get writer;
  @override
  @JsonKey(name: 'Actors', includeIfNull: false)
  String? get actors;
  @override
  @JsonKey(name: 'Plot', includeIfNull: false)
  String? get plot;
  @override
  @JsonKey(name: 'Language', includeIfNull: false)
  String? get language;
  @override
  @JsonKey(name: 'Country', includeIfNull: false)
  String? get country;
  @override
  @JsonKey(name: 'Poster', includeIfNull: false)
  String? get poster;
  @override
  @JsonKey(name: 'imdbID', includeIfNull: false)
  String? get imdbID;
  @override
  @JsonKey(ignore: true)
  _$$_MovieModelCopyWith<_$_MovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}
