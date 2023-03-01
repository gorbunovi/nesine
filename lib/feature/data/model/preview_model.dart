import 'package:nesine/feature/domain/entities/preview_entity.dart';

class PreviewModel extends PreviewEntity{
  PreviewModel({
    required id,
    required title,
    required diskription,
    required image,
  }): super(
    id: id,
    title: title,
    diskription: diskription,
    image: image,
  );

  factory PreviewModel.fromJson(Map<String, dynamic> json){
    return PreviewModel(
      id: json['id'] as int,
      title: json['title'] as String,
      diskription: json['diskription'] as String,
      image: json['image'] as String,
    );
  }
}