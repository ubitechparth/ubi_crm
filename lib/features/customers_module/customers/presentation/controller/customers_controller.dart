import 'package:get/get.dart';

class CustomersController extends GetxController {
  final List<Map<String, String>> _data = [
    {'company': 'Abc Company', 'date': '09 May', 'leadOwner': 'John Doe', 'product': 'Product A'},
    {'company': 'Ubitech', 'date': '10 May', 'leadOwner': 'Jane Smith', 'product': 'Product B'},
    {'company': 'Godrej', 'date': '11 May', 'leadOwner': 'Mike Johnson', 'product': 'Product C'},
    {'company': 'XYZ Corp', 'date': '12 May', 'leadOwner': 'Emily Davis', 'product': 'Product D'},
    {'company': 'PQR Ltd', 'date': '13 May', 'leadOwner': 'David Wilson', 'product': 'Product E'},
    {'company': 'Abc Company', 'date': '14 May', 'leadOwner': 'John Doe', 'product': 'Product A'},
    {'company': 'Ubitech', 'date': '15 May', 'leadOwner': 'Jane Smith', 'product': 'Product B'},
    {'company': 'Godrej', 'date': '16 May', 'leadOwner': 'Mike Johnson', 'product': 'Product C'},
    {'company': 'XYZ Corp', 'date': '17 May', 'leadOwner': 'Emily Davis', 'product': 'Product D'},
  ];

  // RxList to hold lead data
  final RxList<LeadsModel> leadList = <LeadsModel>[].obs;
RxBool listLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getLeadList();
  }

  Future<List<LeadData>> getLeadList() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return _data.map((e) => LeadData.fromMap(e)).toList();
  }

}

// Define LeadData model to hold each entry
class LeadData {
  final String company;
  final String date;
  final String leadOwner;
  final String product;

  LeadData({required this.company, required this.date, required this.leadOwner, required this.product});

  factory LeadData.fromMap(Map<String, String> map) {
    return LeadData(
      company: map['company'] ?? '',
      date: map['date'] ?? '',
      leadOwner: map['leadOwner'] ?? '',
      product: map['product'] ?? '',
    );
  }
}

// Define LeadsModel to hold a list of LeadData
class LeadsModel {
  final String statusCode;
  final List<LeadData> data;

  LeadsModel({required this.statusCode, required this.data});
}
