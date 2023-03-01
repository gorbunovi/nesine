
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UrlLocalDataSource {

  Future<String> getUrlFromCache();
  Future<void> urlToCache(String url);
  Future<bool> containsKey(String key);
}



class UrlLocalDataSorceImpl implements UrlLocalDataSource {
  final SharedPreferences sharedPreferences;
  UrlLocalDataSorceImpl({required this.sharedPreferences});

  @override
  Future<String> getUrlFromCache() async{
    String url = await sharedPreferences.getString('url') ?? '';
    return url;
  }

  @override
  Future<void> urlToCache(String url) async {
    await sharedPreferences.setString('url', url);
  }

  @override
  Future<bool> containsKey(String key) async{
    return sharedPreferences.containsKey(key);
  }


}