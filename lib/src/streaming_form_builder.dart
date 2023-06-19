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

class StreamingFormBuilder extends StatefulWidget {
  const StreamingFormBuilder({required this.builder, super.key});

  final StreamingFormBuilderFn builder;

  @override
  State<StreamingFormBuilder> createState() => _StreamingFormBuilderState();
}

class _StreamingFormBuilderState extends State<StreamingFormBuilder> {
  final StreamController<Map<String, dynamic>> controller = StreamController();
  final FieldFactory fieldFactory = FieldFactory();

  final Map<String, dynamic> previousValue = {};
  final List<StreamSubscription> subs = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fieldFactory.fieldControllers.forEach((key, fieldController) {
        final sub = fieldController.stream.listen((value) {
          previousValue[key] = value;
          controller.add(previousValue);
        });
        subs.add(sub);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    fieldFactory.fieldControllers.forEach((key, value) {
      value.close();
    });
    for (final sub in subs) {
      sub.cancel();
    }
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, controller, fieldFactory);
  }
}

typedef StreamingFormBuilderFn = Widget Function(
  BuildContext context,
  StreamController<Map<String, dynamic>> controller,
  FieldFactory fieldFactory,
);

class FieldFactory {
  FieldFactory();

  final Map<String, StreamController> fieldControllers = {};

  StreamController<T> getFieldController<T>(String key) {
    if (fieldControllers.containsKey(key)) {
      return fieldControllers[key]! as StreamController<T>;
    }

    fieldControllers[key] = StreamController<T>();
    return fieldControllers[key]! as StreamController<T>;
  }
}
