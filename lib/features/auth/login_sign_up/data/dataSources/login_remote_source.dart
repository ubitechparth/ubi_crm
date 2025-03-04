import 'package:ubi_crm/network/api_constants.dart';
import 'package:ubi_crm/network/api_endpoint.dart';
import 'package:ubi_crm/network/api_services/api_services.dart';
import 'package:ubi_crm/network/response.dart';

abstract class ILoginRemoteDataSource {
  Future<ApiResponse> checkUserExist(String mobileNumber, String countryCode);
  Future<ApiResponse> loginAPI(String userValue, String countryCode);
}

class LoginRemoteDataSourceImpl implements ILoginRemoteDataSource {
  final ApiService apiService = ApiService(baseUrl: ApiEndpoint.baseUrl);

  @override
  Future<ApiResponse> checkUserExist(
      String mobileNumber, String countryCode) async {
    final ApiResponse<dynamic> response =
        await apiService.post(endpoint: ApiEndpoint.checkUserExist, payload: {
      ApiConstants.mobileNumber: mobileNumber,
      ApiConstants.countryCode: countryCode,
    });
    return response;
  }

  @override
  Future<ApiResponse> loginAPI(String userName, String password) async {
    final ApiResponse<dynamic> response = await apiService.post(
        endpoint: ApiEndpoint.login,
        payload: {
          ApiConstants.userName: userName,
          ApiConstants.password: password
        });

    return response;
  }
}
