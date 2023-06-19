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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:streaming_forms/streaming_forms.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
        elevation: 4,
      ),
      body: StreamingFormBuilder(
        builder: (context, controller, fieldFactory) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              StreamBuilder(
                builder: (context, snapshot) {
                  final data = snapshot.data ?? {};
                  final raw = json.encode(data);

                  return Center(
                    child: Text(raw),
                  );
                },
                stream: controller.stream,
              ),
              StreamingTextField(
                controller: fieldFactory.getFieldController('name'),
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              StreamingTextField(
                controller: fieldFactory.getFieldController('surname'),
                decoration: const InputDecoration(labelText: 'Surname'),
              ),
              StreamingTextField(
                controller: fieldFactory.getFieldController('age'),
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  StreamingSwitch(
                      controller: fieldFactory.getFieldController('accept')),
                  const Text('Accept the terms and conditions'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
