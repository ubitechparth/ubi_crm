import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubi_crm/features/auth/login_sign_up/data/models/login_model.dart';

class SharedPreferencesValue{

  /// Save LoginModel to SharedPreferences
  Future<void> saveLoginModel(LoginModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert LoginModel to JSON string
    String jsonString = loginModelToJson(loginModel);

    // Save the JSON string to SharedPreferences
    await prefs.setString('login_model', jsonString);
  }

// Retrieve LoginModel from SharedPreferences
  Future<LoginModel?> getLoginModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string from SharedPreferences
    String? jsonString = prefs.getString('login_model');

    if (jsonString != null) {
      // Convert the JSON string to a LoginModel object
      return loginModelFromJson(jsonString);
    }

    return null; // Return null if no LoginModel is found
  }

  // Function to clear SharedPreferences
  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clears all data stored in SharedPreferences
    await prefs.clear();

  }
}