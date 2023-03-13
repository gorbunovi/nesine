
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
      emit(const Preview(gender: 1, colory: 0));
    }else{
      // await initNotify(); //онсигнал
      webcontroller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(_url));
      emit(Page(webViewController: webcontroller));
    }
  }

  void isSelect(int gender){
    print("select = $gender");
    emit(Preview(gender: gender, colory: 0));
  }

  void toCard({required int gender, required int weight, required int height, required int age}){
    print('toCard');
    if(gender == 1){
      emit(Preview(gender: gender, colory: _man(weight: weight, height: height, age: age)));
    }else {
      emit(Preview(gender: gender, colory: _woman(weight: weight, height: height, age: age)));
    }

  }

  double _man({required int weight, required int height, required int age}){
    double resault = 10*weight+6.25*height-5*age+5;
    return resault;
  }

  double _woman({required int weight, required int height, required int age}){
    double resault = (10*weight)+(6.25*height)-(5*age)-161;
    return resault;
  }


//онсигнал
  // static initNotify() async {
  //   try {
  //     await OneSignal.shared.promptUserForPushNotificationPermission();
  //     await OneSignal.shared.setAppId('3a20a92d-3a40-4634-a97b-52810a2018ec');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}
