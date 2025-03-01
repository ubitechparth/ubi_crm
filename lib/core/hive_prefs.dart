import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


class AppPreferences {
  AppPreferences._privateConstructor();

  static final AppPreferences _instance = AppPreferences._privateConstructor();

  static AppPreferences get instance => _instance;

  late Box<dynamic> _box;



  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _box = await Hive.openBox('ubisales');
  }

  Box<dynamic> get hiveDb => _box;

  int get languageIndexValue => _box.get('languageIndexValue') ?? 0;
  set languageIndexValue(int value) => _box.put('languageIndexValue', value);

  String get countryCode => _box.get('countryCode') ?? '';
  set countryCode(String value) => _box.put('countryCode', value);
  String get countryCodeId => _box.get('countryCodeId') ?? '';
  set countryCodeId(String value) => _box.put('countryCodeId', value);

  String get countryName => _box.get('countryName') ?? '';
  set countryName(String value) => _box.put('countryName', value);

  String get countryDigit => _box.get('countryDigit') ?? '';
  set countryDigit(String value) => _box.put('countryDigit', value);

}
