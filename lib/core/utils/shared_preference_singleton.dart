import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceSingleton {
  static final SharedPreferenceSingleton _instance = SharedPreferenceSingleton._internal();
  factory SharedPreferenceSingleton() => _instance;
  SharedPreferenceSingleton._internal();

  static const String isHideOnBoardingScreen = 'isHideOnBoardingScreen';
  static const String isDarkTheme = 'isDarkTheme';

  SharedPreferencesWithCache? _pref;

  Future<void> initialize() async {
    const allowList = <String>{isHideOnBoardingScreen, isDarkTheme};

    _pref = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        // When an allowlist is included, any keys that aren't included cannot be used.
        allowList: allowList,
      ),
    );
    
  }

  // if you want to store and retrive string in the share prefrences then us below methods
  Future<void> setString(String key, String value) async => await _pref!.setString(key, value);
  getString(String key) => _pref!.getString(key) ?? '';

  // if you want to store and retrive boolean in the share prefrences then us below methods
  Future<void> setBool(String key, bool value) async => await _pref!.setBool(key, value);
  getBool(String key) => _pref!.getBool(key) ?? false;

  // if you want to store and retrive int in the share prefrences then us below methods
  Future<void> setInt(String key, int value) async => await _pref!.setInt(key, value);
  getInt(String key) => _pref!.getInt(key) ?? 0;

  // if you want to store and retrive double in the share prefrences then us below methods
  Future<void> setDouble(String key, double value) async => await _pref!.setDouble(key, value);
  getDouble(String key) => _pref!.getDouble(key) ?? 0.0;

  // if you want to store and retrive string array in the share prefrences then us below methods
  Future<void> setStringList(String key, List<String> value) async => await _pref!.setStringList(key, value);
  getStringList(String key) => _pref!.getStringList(key) ?? List.empty();

  // if you want to remove any data from share preference then use this method
  Future<void> remove(String key) async => await _pref!.remove(key);

  // if you want to clear all of the shared prefreneces then use this method
  // Since the filter options are set at creation, they aren't needed during clear.
  Future<void> clear() async => await _pref!.clear();


}
