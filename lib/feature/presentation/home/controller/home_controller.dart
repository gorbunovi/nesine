
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesine/feature/data/datasources/local/news_sport.dart';
import 'package:nesine/feature/domain/entities/preview_entity.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../domain/usecases/get_url.dart';
import '../../../routes/app_routes.dart';
import 'index.dart';
import 'package:get/get.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({required this.getUrl}) : super(const Initial());
  final GetUrl getUrl;
  late String _url;
  late final WebViewController webcontroller;
  final List<PreviewEntity> previewList = [
    PreviewEntity(id: 1, title: 'Aleksei Oleynik', diskription: '“Boa-Constrictor” TOP 10 heavyweight UFC fighter! MMA legend ! Proud husband and father !', image: 'https://static.getfitshape.com/user/pride_kharkov_inbox_ru/small_photo.jpg?v=1612344482'),
    PreviewEntity(id: 1, title: 'Aleksei Oleynik', diskription: '“Boa-Constrictor” TOP 10 heavyweight UFC fighter! MMA legend ! Proud husband and father !', image: 'https://static.getfitshape.com/user/pride_kharkov_inbox_ru/small_photo.jpg?v=1612344482'),
    PreviewEntity(id: 1, title: 'Aleksei Oleynik', diskription: '“Boa-Constrictor” TOP 10 heavyweight UFC fighter! MMA legend ! Proud husband and father !', image: 'https://static.getfitshape.com/user/pride_kharkov_inbox_ru/small_photo.jpg?v=1612344482'),
  ];

  final List<PreviewEntity> previewList2 = NewsSports().previewList;

  Future<void> init() async{
    final currentState = state;
    emit(const Loading());

    final failureOrUrl = await getUrl();

    failureOrUrl.fold(
          (failure) => emit(Error(failure)),
          (resault){
        if(resault != null){
          _url = resault;
        } else {
          _url = resault;
        }
      },
    );

    if (_url == 'no internet'){
      emit(const Internet());
    }else if(_url=='pre'){
      emit(Preview(previewList: previewList2));
    }else{
      await initNotify();
      webcontroller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(_url));
      emit(Page(webViewController: webcontroller));
    }
  }

  void toCard(PreviewEntity preview){
    print('toCard');
    Get.toNamed(Routes.CARD, arguments: preview);
  }

  static initNotify() async {
    try {
      await OneSignal.shared.promptUserForPushNotificationPermission();
      await OneSignal.shared.setAppId('3a20a92d-3a40-4634-a97b-52810a2018ec');
    } catch (e) {
      print(e);
    }
  }

}
