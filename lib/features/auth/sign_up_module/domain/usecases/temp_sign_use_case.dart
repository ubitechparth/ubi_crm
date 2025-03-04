import 'package:ubi_crm/features/auth/sign_up_module/domain/repositories/sign_up_repository.i.dart';
import 'package:ubi_crm/network/response.dart';

class TempSignUpUseCase{
  ISignUpRepository repository;
  TempSignUpUseCase(this.repository);

  Future<ApiResponse> execute(String? userName,String? companyName,String? password,String? countryCode,String? phoneNumber, String? email)async{
    return await repository.tempSignUp(userName,companyName,password,countryCode, phoneNumber, email);
  }

}