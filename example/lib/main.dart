import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forms/forms.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final StreamController<bool> _switchController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examples'),
        elevation: 4,
      ),
      body: ListView(
        children: [
          //-------------//
          // FormsSwitch //
          //-------------//
          FormsSwitch(
            controller: _switchController,
            // initialValue: false,
          ),
          StreamBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('There is no stream yet.');
                case ConnectionState.waiting:
                  return const Text('Waiting for stream connection...');
                case ConnectionState.active:
                  return Text('Switch data: ${snapshot.data}');
                case ConnectionState.done:
                  return const Text('Stream is completed.');
              }
            },
            stream: _switchController.stream,
          ),
        ],
      ),
    );
  }
}
