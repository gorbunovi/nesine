
import 'package:dartz/dartz.dart';
import 'package:nesine/core/error/failure.dart';

abstract class UrlRepository{
  Future<Either<Failure,String>> getUrl();
}