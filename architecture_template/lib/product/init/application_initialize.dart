//This class used to initialize the application process
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable
final class ApplicationInitialize {
//  Project basic required initialize
  Future<void> make() async {
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

//This method used to initialize the application process
  Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    //Todo : Splash
    await DeviceUtility.instance.initPackageInfo();
    FlutterError.onError = (details) {
      ///crashlytics log insert here
      ///custom service or custom logger insert here
      // Todo: add custom logger
      Logger().e(details.exceptionAsString());
    };
  }
}
