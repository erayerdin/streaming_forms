import 'package:flutter/material.dart';
import 'package:streaming_forms_example/home.page.dart';
import 'package:streaming_forms_example/individual_widgets.page.dart';
import 'package:streaming_forms_example/lights.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming Forms Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/individual': (context) => const IndividualWidgetsPage(),
        '/lights': (context) => const LightsPage(),
      },
      initialRoute: '/',
    );
  }
}
