import 'package:besafe/screens/google_map_screen.dart';
import 'package:besafe/screens/recording.dart';
import 'package:besafe/screens/emergency.dart';
import 'package:besafe/screens/signin_screen.dart';
import 'package:besafe/screens/sos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      title: 'Be Safe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
      routes: {
        "/record": (context) => RecordingPage(),
        '/sos': (context)=> SOS_Screen(),
        '/map' : (context) =>  MapSample(),
        '/emergency' : (context) =>  Emergency(),
      },
    );
  }
}
