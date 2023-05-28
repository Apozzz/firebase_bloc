import 'package:bloc_firebase/src/common_widgets/fade_in_animation/bloc/fade_in_animation_bloc.dart';
import 'package:bloc_firebase/src/features/firebase/ui/firebase.dart';
import 'package:bloc_firebase/src/features/login/screens/login_screen.dart';
import 'package:bloc_firebase/src/features/splash_screen/screens/splash_screen.dart';
import 'package:bloc_firebase/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'src/service/firebase_service.dart';

GetIt locator = GetIt.instance;

void setupSingletons() async {
  locator.registerLazySingleton<FirebaseService>(() => FirebaseService());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FadeInAnimationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darTheme,
        themeMode: ThemeMode.system,
        home: const LoginScreen(),
      ),
    );
  }
}
