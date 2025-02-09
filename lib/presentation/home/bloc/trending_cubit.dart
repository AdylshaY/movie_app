import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app_clean_architecture/presentation/home/bloc/trending_state.dart';
import 'package:movie_app_clean_architecture/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error) => emit(
        FailureLoadTrendingMovies(errorMessage: error),
      ),
      (data) => emit(
        TrendingMoviesLoaded(movies: data),
      ),
    );
  }
}
