import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/core/config/assets/app_images.dart';
import 'package:movie_app_clean_architecture/presentation/home/bloc/trending_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/home/bloc/trending_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FailureLoadTrendingMovies) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          if (state is TrendingMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies
                  .map(
                    (e) =>
                        AppImages.movieImageBasePath + e.posterPath.toString(),
                  )
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }

          return Container();
        },
      ),
    );
  }
}
