import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:stylehub/app/style_hub.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/services/observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupLocator();
 await locator<CacheHelper>().init();
  runApp(const StyLish());
}
