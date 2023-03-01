import 'package:nesine/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:nesine/core/error/failure.dart';
import 'package:nesine/feature/domain/repositories/catalog_repository.dart';

class GetUrl extends UseCaseNoParams<String>{
  GetUrl(this.catalogRepository);

  final UrlRepository catalogRepository;

  @override
  Future<Either<Failure, String>> call() async {
    try{
      return catalogRepository.getUrl();
    } catch(e){
     return Left(CacheFailure(e.toString()));
    }
  }
}