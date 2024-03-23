import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_store/data/repositories/authentication/authentication.repository.dart';
import 'package:s_store/firebase_options.dart';

import 'app.dart';

Future<void> main() async {
  // --- Add Wdigets Bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // --- Tinitialize local storage
  await GetStorage.init();

  // --- Await Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // --- Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  // Todo: Initialize Authentication

  runApp(const App());
}
