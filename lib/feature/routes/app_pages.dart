import 'package:flutter/material.dart';
import 'package:nesine/feature/presentation/card/view/card_view.dart';
import 'package:nesine/feature/presentation/home/view/home_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return const HomePage();
        });
      },
      getPages: [
        GetPage(
            name: Routes.HOME,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 500),
            page: () => const HomePage(),
        ),
        GetPage(
            name: Routes.CARD,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 500),
            page: () => const CardPage(),
        ),
      ]
    );
  }
}


