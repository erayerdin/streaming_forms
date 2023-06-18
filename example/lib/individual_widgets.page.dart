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
  IndividualWidgetsPage({super.key});

  final StreamController<bool> _switchController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examples'),
        elevation: 4,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
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
