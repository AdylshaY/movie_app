import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/usecase/usecase.dart';
import 'package:movie_app_clean_architecture/data/auth/models/signin_req_params.dart';
import 'package:movie_app_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:movie_app_clean_architecture/service_locator.dart';

class SignInUseCase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}
