import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/usecase/usecase.dart';
import 'package:movie_app_clean_architecture/domain/movie/repositories/movie.dart';
import 'package:movie_app_clean_architecture/service_locator.dart';

class GetTrendingMoviesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
