// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sembast/sembast.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'core/blocs/authentication/authentication_bloc.dart' as _i27;
import 'core/blocs/bootstart/bootstart_bloc.dart' as _i28;
import 'core/utils/connectivity_utils.dart' as _i12;
import 'data/local/datasources/movie_local_datasource.dart' as _i6;
import 'data/local/datasources/user_local_datasource.dart' as _i10;
import 'data/network/datasources/movie_omdb_datasource.dart' as _i8;
import 'data/sharedpref/datasources/authentication_datasource.dart' as _i3;
import 'domain/repository/repository.dart' as _i11;
import 'domain/usecases/authentication/clear_token.dart' as _i15;
import 'domain/usecases/authentication/get_token.dart' as _i21;
import 'domain/usecases/authentication/is_authenticated_user.dart' as _i23;
import 'domain/usecases/authentication/set_token.dart' as _i14;
import 'domain/usecases/movie/get_local_movie_list.dart' as _i17;
import 'domain/usecases/movie/get_movie_by_imdb_id.dart' as _i18;
import 'domain/usecases/movie/get_movie_by_title.dart' as _i19;
import 'domain/usecases/movie/is_local_movie_empty.dart' as _i24;
import 'domain/usecases/movie/movie_bootstart_sync.dart' as _i26;
import 'domain/usecases/movie/search_movie_by_title.dart' as _i13;
import 'domain/usecases/user/do_login.dart' as _i16;
import 'domain/usecases/user/get_user_by_token.dart' as _i20;
import 'presentations/home/bloc/home_bloc.dart' as _i22;
import 'presentations/login/bloc/login_bloc.dart' as _i25;
import 'presentations/login/cubit/login_form_field_cubit.dart' as _i5;
import 'presentations/splash/cubit/splash_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthenticationDataSource>(() =>
      _i3.AuthenticationDataSource(
          sharedPreferences: get<_i4.SharedPreferences>()));
  gh.factory<_i5.LoginFormFieldCubit>(() => _i5.LoginFormFieldCubit());
  gh.lazySingleton<_i6.MovieLocalDataSource>(
      () => _i6.MovieLocalDataSource(database: get<_i7.Database>()));
  gh.lazySingleton<_i8.MovieOmdbDataSource>(() => _i8.MovieOmdbDataSource());
  gh.factory<_i9.SplashCubit>(() => _i9.SplashCubit());
  gh.lazySingleton<_i10.UserLocalDataSource>(
      () => _i10.UserLocalDataSource(database: get<_i7.Database>()));
  gh.lazySingleton<_i11.RepositoryDependencies>(() =>
      _i11.RepositoryDependencies(
          connectivityUtils: get<_i12.ConnectivityUtils>(),
          authenticationDataSource: get<_i3.AuthenticationDataSource>(),
          userLocalDataSource: get<_i10.UserLocalDataSource>(),
          movieOmdbDataSource: get<_i8.MovieOmdbDataSource>(),
          movieLocalDataSource: get<_i6.MovieLocalDataSource>()));
  gh.lazySingleton<_i11.Repository>(
      () => _i11.Repository(d: get<_i11.RepositoryDependencies>()));
  gh.lazySingleton<_i13.SearchMovieByTitle>(
      () => _i13.SearchMovieByTitle(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i14.SetUserToken>(
      () => _i14.SetUserToken(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i15.ClearUserToken>(
      () => _i15.ClearUserToken(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i16.DoLogin>(
      () => _i16.DoLogin(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i17.GetLocalMovieList>(
      () => _i17.GetLocalMovieList(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i18.GetMovieByImdbID>(
      () => _i18.GetMovieByImdbID(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i19.GetMovieByTitle>(
      () => _i19.GetMovieByTitle(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i20.GetUserByToken>(
      () => _i20.GetUserByToken(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i21.GetUserToken>(
      () => _i21.GetUserToken(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i22.HomeBloc>(() => _i22.HomeBloc(
      getLocalMovieList: get<_i17.GetLocalMovieList>(),
      searchMovieByTitle: get<_i13.SearchMovieByTitle>()));
  gh.lazySingleton<_i23.IsAuthenticatedUser>(
      () => _i23.IsAuthenticatedUser(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i24.IsLocalMovieEmpty>(
      () => _i24.IsLocalMovieEmpty(repository: get<_i11.Repository>()));
  gh.factory<_i25.LoginBloc>(() => _i25.LoginBloc(
      doLogin: get<_i16.DoLogin>(), setToken: get<_i14.SetUserToken>()));
  gh.lazySingleton<_i26.MovieBootstartSync>(
      () => _i26.MovieBootstartSync(repository: get<_i11.Repository>()));
  gh.lazySingleton<_i27.AuthenticationBloc>(() => _i27.AuthenticationBloc(
      getAuthenticatedUser: get<_i20.GetUserByToken>(),
      getUserToken: get<_i21.GetUserToken>(),
      clearUserToken: get<_i15.ClearUserToken>()));
  gh.lazySingleton<_i28.BootStartBloc>(() => _i28.BootStartBloc(
      connectivityUtils: get<_i12.ConnectivityUtils>(),
      isAuthenticatedUser: get<_i23.IsAuthenticatedUser>(),
      getToken: get<_i21.GetUserToken>(),
      getAuthenticatedUser: get<_i20.GetUserByToken>(),
      isLocalMovieEmpty: get<_i24.IsLocalMovieEmpty>(),
      movieBootstartSync: get<_i26.MovieBootstartSync>()));
  return get;
}
