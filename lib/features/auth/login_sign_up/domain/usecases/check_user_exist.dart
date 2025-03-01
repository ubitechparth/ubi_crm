

import 'package:ubi_crm/features/auth/login_sign_up/domain/repositories/login_repo.i.dart';
import 'package:ubi_crm/network/response.dart';

class CheckUserExistUseCase {
  final ILoginRepository repository;

  CheckUserExistUseCase(this.repository);

  Future<ApiResponse> execute(String mobileNumber,String countryCode) async {
    return await repository.checkUserExist(mobileNumber,countryCode);
  }
}
