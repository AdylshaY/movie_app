import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/data/auth/models/signin_req_params.dart';

import 'package:movie_app_clean_architecture/data/auth/models/signup_req_params.dart';
import 'package:movie_app_clean_architecture/data/auth/sources/auth_api_service.dart';
import 'package:movie_app_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:movie_app_clean_architecture/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    var data = await sl<AuthApiService>().signUp(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.setString('token', data['user']['token']);

        return Right(data);
      },
    );
  }

  @override
  Future<Either> signIn(SigninReqParams params) async {
    var data = await sl<AuthApiService>().signIn(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.setString('token', data['user']['token']);

        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var token = sharedPreferences.getString('token');

    return token == null ? false : true;
  }
}
