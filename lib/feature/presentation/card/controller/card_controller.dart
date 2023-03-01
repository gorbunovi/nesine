import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesine/feature/domain/entities/preview_entity.dart';
import 'package:nesine/feature/presentation/card/controller/state.dart';
import 'package:get/get.dart';
class CardController extends Cubit<CardState>{
  CardController() : super(const Initial());



  Future<void> init() async{
    final currentState = state;
    emit(const Loading());
    if(currentState is Loading) return;
    PreviewEntity _preview = Get.arguments;
    emit(Preview(preview: _preview));
  }
}