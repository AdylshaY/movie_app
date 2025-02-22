import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/constants/api_url.dart';
import 'package:movie_app_clean_architecture/core/network/dio_client.dart';
import 'package:movie_app_clean_architecture/service_locator.dart';

abstract class MovieApiService {
  Future<Either> getTrendingMovies();
}

class MovieApiServiceImpl extends MovieApiService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
