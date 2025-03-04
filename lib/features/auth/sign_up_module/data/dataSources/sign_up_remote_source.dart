import 'package:ubi_crm/network/api_constants.dart';
import 'package:ubi_crm/network/api_endpoint.dart';
import 'package:ubi_crm/network/api_services/api_services.dart';
import 'package:ubi_crm/network/response.dart';

abstract class ISignUpRemoteDataSource {
  Future<ApiResponse> tempSignUp(String? userName,String? companyName,String? password,String? countryCode,String? phoneNumber, String? email);
}

class SignUpRemoteDataSourceImpl implements ISignUpRemoteDataSource {
  final ApiService apiService = ApiService(baseUrl: ApiEndpoint.baseUrl);
  @override
  Future<ApiResponse> tempSignUp(String? userName,String? companyName,String? password,String? countryCode,String? phoneNumber, String? email) async {
    final ApiResponse<dynamic> response = await apiService.post(endpoint: ApiEndpoint.tempSignUp, payload: {
      ApiConstants.userName: userName,
      ApiConstants.companyName: companyName,
      ApiConstants.password: password,
      ApiConstants.countryCode: countryCode,
      ApiConstants.mobileNumber: phoneNumber,
      ApiConstants.emailId: email,
    });
    return response;
  }
}
