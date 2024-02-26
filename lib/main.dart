import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:stylehub/app/style_hub.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/services/observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupLocator();
  runApp(const StyLish());
}
