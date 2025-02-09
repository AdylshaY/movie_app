import 'package:get_it/get_it.dart';
import 'package:movie_app_clean_architecture/core/network/dio_client.dart';
import 'package:movie_app_clean_architecture/data/auth/repositories/auth.dart';
import 'package:movie_app_clean_architecture/data/auth/sources/auth_api_service.dart';
import 'package:movie_app_clean_architecture/data/movie/repositories/movie.dart';
import 'package:movie_app_clean_architecture/data/movie/sources/movie_api_service.dart';
import 'package:movie_app_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:movie_app_clean_architecture/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app_clean_architecture/domain/auth/usecases/signin.dart';
import 'package:movie_app_clean_architecture/domain/auth/usecases/signup.dart';
import 'package:movie_app_clean_architecture/domain/movie/repositories/movie.dart';
import 'package:movie_app_clean_architecture/domain/movie/usecases/get_trending_movies.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieApiService>(MovieApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // Use cases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}
