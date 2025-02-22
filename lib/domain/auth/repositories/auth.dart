import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/data/auth/models/signin_req_params.dart';
import 'package:movie_app_clean_architecture/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupReqParams params);
  Future<Either> signIn(SigninReqParams params);
  Future<bool> isLoggedIn();
}
