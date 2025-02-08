import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/helper/navigation/app_navigation.dart';

import 'package:movie_app_clean_architecture/core/config/assets/app_images.dart';
import 'package:movie_app_clean_architecture/presentation/auth/pages/sign_in.dart';
import 'package:movie_app_clean_architecture/presentation/home/pages/home.dart';
import 'package:movie_app_clean_architecture/presentation/splash/bloc/splash_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, const SignInPage());
          }

          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF1A1B20).withOpacity(0),
                    const Color(0xFF1A1B20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
