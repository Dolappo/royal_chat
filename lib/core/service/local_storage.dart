import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class LocalStorage{
Future<SharedPreferences> prefs = SharedPreferences.getInstance();

void saveData(String string, String key) async{
  SharedPreferences pref = await prefs;
  pref.setString(key, string);
}

void saveAsList(List<Map<String, dynamic>> data, String key) async{
  SharedPreferences pref = await prefs;
  pref.setString(key, jsonEncode(data));
}


  Future<bool> checkContains(String key)async{
    SharedPreferences pref = await prefs;
    return pref.containsKey(key);
  }
}
