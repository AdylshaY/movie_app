import 'package:movie_app_clean_architecture/core/usecase/usecase.dart';
import 'package:movie_app_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:movie_app_clean_architecture/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
