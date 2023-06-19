import 'dart:async';

import 'package:flutter/material.dart';
import 'package:streaming_forms_example/home.page.dart';
import 'package:streaming_forms_example/individual_widgets.page.dart';
import 'package:streaming_forms_example/lights.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StreamController<bool> _lightSwitchController =
      StreamController.broadcast();

  @override
  void dispose() {
    _lightSwitchController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        final isLight = snapshot.data ?? true;

        return MaterialApp(
          title: 'Streaming Forms Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const HomePage(),
            '/individual': (context) => const IndividualWidgetsPage(),
            '/lights': (context) =>
                LightsPage(lightController: _lightSwitchController),
          },
          initialRoute: '/',
        );
      },
      stream: _lightSwitchController.stream,
    );
  }
}
