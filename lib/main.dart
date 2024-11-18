import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';
import 'core/utils/shared_preference_singleton.dart';
import 'firebase_options.dart';
import 'my_app.dart';
import 'presentation/router/app_router.dart';
import 'simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceSingleton().initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp(appRouter: AppRouter(), userRepository: FirebaseUserRepo()));
}
