import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/provider/auth_provider.dart';
import 'package:pygmyapp_menu/provider/card_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pygmyapp_menu/provider/menu_provider.dart';
import 'package:pygmyapp_menu/provider/video_provider.dart';
import 'firebase_options.dart';

import 'lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => MenuProvider()),
      ChangeNotifierProvider(create: (context) => VideoProvider()),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: SplashScreen(),
    );
  }
}
