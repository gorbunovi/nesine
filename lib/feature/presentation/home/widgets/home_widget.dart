import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWidget extends StatelessWidget {
   HomeWidget({
     Key? key,
     required this.controller,
   }) : super(key: key);

 final WebViewController controller;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()){
          controller.goBack();
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
