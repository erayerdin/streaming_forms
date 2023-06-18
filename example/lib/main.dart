import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Stream<bool> _switchStream = const Stream.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examples'),
        elevation: 4,
      ),
      body: Center(
        child: ListView(
          children: [
            //-------------//
            // FormsSwitch //
            //-------------//
            FormsSwitch(
              stream: _switchStream,
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
              stream: _switchStream,
            ),
          ],
        ),
      ),
    );
  }
}
