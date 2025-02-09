import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app_clean_architecture/data/movie/models/movie.dart';
import 'package:movie_app_clean_architecture/data/movie/sources/movie_api_service.dart';
import 'package:movie_app_clean_architecture/domain/movie/entites/movie.dart';
import 'package:movie_app_clean_architecture/domain/movie/repositories/movie.dart';
import 'package:movie_app_clean_architecture/service_locator.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieApiService>().getTrendingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<MovieEntity> movies = List.from(data['content'])
            .map(
              (element) => MovieMapper.toEntity(MovieModel.fromJson(element)),
            )
            .toList();

        return Right(movies);
      },
    );
  }
}
