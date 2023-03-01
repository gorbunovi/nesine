import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nesine/feature/routes/app_pages.dart';
import 'servise_locator.dart' as di;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}