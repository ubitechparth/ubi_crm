import 'package:ubi_crm/network/response.dart';

abstract class ISignUpRepository{
Future<ApiResponse> tempSignUp(String? userName,String? companyName,String? password,String? countryCode,String? phoneNumber, String? email);
}