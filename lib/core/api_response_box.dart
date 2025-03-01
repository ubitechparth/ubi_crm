import 'package:hive/hive.dart';
part 'api_response_box.g.dart';  
 
@HiveType(typeId: 0) //declare unique for every class
class ApiResponseBox extends HiveObject {
  @HiveField(0) //unique index of the field
  String? url;
 
  @HiveField(1)
  String? response;
 
  @HiveField(2)
  int? timestamp;
}