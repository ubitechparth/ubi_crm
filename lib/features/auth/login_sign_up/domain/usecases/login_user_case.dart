import 'package:ubi_crm/features/auth/login_sign_up/domain/repositories/login_repo.i.dart';
import 'package:ubi_crm/network/response.dart';

class LoginUseCase{
  final ILoginRepository repository;
  LoginUseCase(this.repository);

  Future<ApiResponse> execute(String userValue,String password) async {
    return await repository.loginAPI(userValue,password);
  }
}