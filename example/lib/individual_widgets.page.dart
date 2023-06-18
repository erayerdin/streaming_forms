// Copyright 2023 Eray Erdin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forms/forms.dart';

class IndividualWidgetsPage extends StatelessWidget {
  const IndividualWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examples'),
        elevation: 4,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: constraints.maxWidth ~/ 300,
          children: [
            _buildSection(context, child: const _SwitchSection()),
          ],
        );
      }),
    );
  }

  Widget _buildSection(BuildContext context, {required Widget child}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

//-------------//
// FormsSwitch //
//-------------//

class _SwitchSection extends StatefulWidget {
  const _SwitchSection();

  @override
  State<_SwitchSection> createState() => _SwitchSectionState();
}

class _SwitchSectionState extends State<_SwitchSection> {
  final StreamController<bool> _controller = StreamController();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Switch',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        FormsSwitch(
          controller: _controller,
          // initialValue: false,
        ),
        Center(
          child: StreamBuilder(
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
            stream: _controller.stream,
          ),
        )
      ],
    );
  }
}
