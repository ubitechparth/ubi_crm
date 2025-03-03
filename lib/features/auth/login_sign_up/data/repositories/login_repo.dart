

import 'package:ubi_crm/features/auth/login_sign_up/data/datasources/login_remote_source.dart';
import 'package:ubi_crm/features/auth/login_sign_up/domain/repositories/login_repo.i.dart';
import 'package:ubi_crm/network/response.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);


  @override
  Future<ApiResponse> checkUserExist(String mobileNumber,String countryCode) async {
    return await remoteDataSource.checkUserExist(mobileNumber,countryCode);
  }

  @override
  Future<ApiResponse> loginAPI(String userValue, String password)async{
    return await remoteDataSource.loginAPI(userValue,password);
  }



}
