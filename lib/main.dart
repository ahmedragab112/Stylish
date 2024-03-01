import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stylehub/app/style_hub.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/services/observer.dart';
import 'package:stylehub/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupLocator();
  await Future.wait([
    locator<CacheHelper>().init(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  ]);

  runApp(const StyLish());
}
