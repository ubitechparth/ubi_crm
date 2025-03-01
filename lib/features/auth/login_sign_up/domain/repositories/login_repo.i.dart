

import 'package:ubi_crm/network/response.dart';

abstract class ILoginRepository {
  Future<ApiResponse> checkUserExist(String mobileNumber,String countryCode); //check user exist or not
  Future<ApiResponse> loginAPI(String userVale,String password); //check user exist or not
}
