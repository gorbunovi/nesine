import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:nesine/core/error/exception.dart';
import 'package:nesine/core/error/failure.dart';
import 'package:nesine/core/platform/network_info.dart';
import 'package:nesine/feature/data/datasources/local/local_data_source.dart';
import 'package:nesine/feature/data/datasources/remote/remote_data_source.dart';
import 'package:nesine/feature/domain/repositories/catalog_repository.dart';

class UrlRepositoryImpl implements UrlRepository {
  UrlRepositoryImpl({
    required this.urlLocalDataSorce,
    required this.urlRemoteDataSource,
    required this.networkInfo,
  });

  final UrlLocalDataSource urlLocalDataSorce;
  final UrlRemoteDataSource urlRemoteDataSource;
  final NetworkInfo networkInfo;


  @override
  Future<Either<Failure, String>> getUrl() async {
    String url;

    try{
      if(await urlLocalDataSorce.containsKey('url')) {// проверка на ссылку
        //ссылка есть
        if(await networkInfo.isConnected) { // проверка есть ли интернет
          // интернет есть
          url= await urlLocalDataSorce.getUrlFromCache(); //получение ссылки из кэша
          return Right(url);
        }else{
          // интернета нет
          return const Right('no internet');
        }
      }else{
        //ссылки нет
        final isE =  await ballScokers(); // проверка на эмулятор
        url = await urlRemoteDataSource.getUrl(); //получение ссылки из FireBace
        if(url == '' || isE){ // проверка на пустую ссылку и эмулятор
          // ссылка пустая или запустили на эмуляторе
          return  const Right('pre');
        }else{
          //сылка с данными
          await urlLocalDataSorce.urlToCache(url); // сохранение ссылки в кэш
          return Right(url);
        }
      }
    }on CacheException{
      return Left(CacheFailure(''));
    }
  }

  Future<bool> ballScokers() async {
    DeviceInfoPlugin ballinfo = DeviceInfoPlugin();
    final em = await ballinfo.androidInfo;
    var phoneModel = em.model;
    var buildProduct = em.product;
    var buildHardware = em.hardware;

    var result = (em.fingerprint.startsWith("generic") ||
        phoneModel.contains("google_sdk") ||
        phoneModel.contains("droid4x") ||
        phoneModel.contains("Emulator") ||
        phoneModel.contains("Android SDK built for x86") ||
        em.manufacturer.contains("Genymotion") ||
        buildHardware == "goldfish" ||
        buildHardware == "vbox86" ||
        buildProduct == "sdk" ||
        buildProduct == "google_sdk" ||
        buildProduct == "sdk_x86" ||
        buildProduct == "vbox86p" ||
        !em.isPhysicalDevice ||
        em.brand.contains('google') ||
        em.board.toLowerCase().contains("nox") ||
        em.bootloader.toLowerCase().contains("nox") ||
        buildHardware.toLowerCase().contains("nox") ||
        buildProduct.toLowerCase().contains("nox"));

    if (result) return true;
    result = result ||
        (em.brand.startsWith("generic") && em.device.startsWith("generic"));
    if (result) return true;
    result = result || ("google_sdk" == buildProduct);
    return result;
  }
}
