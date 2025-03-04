import 'package:ubi_crm/features/auth/sign_up_module/data/dataSources/sign_up_remote_source.dart';
import 'package:ubi_crm/features/auth/sign_up_module/domain/repositories/sign_up_repository.i.dart';
import 'package:ubi_crm/network/response.dart';

class SignRepositoryImpl implements ISignUpRepository{
  ISignUpRemoteDataSource remoteDataSource;
  SignRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse> tempSignUp(String? userName,String? companyName,String? password,String? countryCode,String? phoneNumber, String? email) async {
      return await remoteDataSource.tempSignUp(userName,companyName,password,countryCode, phoneNumber, email);
  }
}