import 'package:dating_app/screens/mixer_main_page.dart';
import 'package:dating_app/screens/mixer_subscription_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Mixer App',
      
      home: MixerMainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

