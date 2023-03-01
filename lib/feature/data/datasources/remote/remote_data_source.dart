import 'dart:convert';




import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart' show rootBundle;

abstract class UrlRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character/?page=1 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> getUrl();
}

class UrlRemoteDataSourceImpl implements UrlRemoteDataSource {
  http.Client client;

  UrlRemoteDataSourceImpl({required this.client});


  @override
  Future<String> getUrl() async{
    final RemoteConfig remoteConfig = RemoteConfig.instance;
    await remoteConfig.fetch();
    await remoteConfig.activate();
    return remoteConfig.getString('url');   //'https://getfitshape.com/en/coaches/13';
  }


}