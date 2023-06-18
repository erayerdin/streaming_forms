import 'package:flutter/material.dart';
import 'package:forms_example/home.page.dart';
import 'package:forms_example/individual_widgets.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/individual': (context) => IndividualWidgetsPage(),
      },
      initialRoute: '/',
    );
  }
}
