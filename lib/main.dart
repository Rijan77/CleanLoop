import 'package:cleanloop/pages/Forgot_Password.dart';
import 'package:cleanloop/pages/SplasScreen.dart';
import 'package:cleanloop/pages/homePage.dart';
import 'package:cleanloop/pages/tracking_location/location_confirmation.dart';
import 'package:cleanloop/pages/tracking_location/map_page.dart';
import 'package:cleanloop/pages/userProfile.dart';
import 'package:cleanloop/pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:    WasteCleaningHomePage(),
    );
  }
}
