import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/my_app.dart';
import 'package:simple_ecommerce_flutter_task/core/error/custom_error.dart';
import 'package:simple_ecommerce_flutter_task/core/network/bloc_observer.dart';
import 'package:simple_ecommerce_flutter_task/core/network/http_certificate.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.instance.init();
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  customError();
  runApp(MyApp());
}
