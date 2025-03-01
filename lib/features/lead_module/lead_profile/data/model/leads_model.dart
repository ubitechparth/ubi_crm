class LeadsModel {
  final String statusCode;
  final List<DataItem> data;

  LeadsModel({
    required this.statusCode,
    required this.data,
  });

  // Factory method to parse JSON into the model
  factory LeadsModel.fromJson(Map<String, dynamic> json) {
    return LeadsModel(
      statusCode: json['statusCode'],
      data: (json['data'] as List).map((item) => DataItem.fromJson(item)).toList(),
    );
  }
}

class DataItem {
  final String company;
  final String date;
  final String leadOwner;
  final String product;

  DataItem({
    required this.company,
    required this.date,
    required this.leadOwner,
    required this.product,
  });

  // Factory method to parse JSON into the model
  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      company: json['company'],
      date: json['date'],
      leadOwner: json['leadOwner'],
      product: json['product'],
    );
  }
}