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

/// {@template formstextfield}
/// A text field with streams.
/// {@endtemplate}
class FormsTextField extends StatefulWidget {
  /// {@macro formstextfield}
  const FormsTextField({
    required this.controller,
    this.initialValue = '',
    super.key,
  });

  final StreamController<String> controller;
  final String initialValue;

  @override
  State<FormsTextField> createState() => _FormsTextFieldState();
}

class _FormsTextFieldState extends State<FormsTextField> {
  late String value;
  late TextEditingController _controller;

  @override
  void initState() {
    value = widget.initialValue;
    _controller = TextEditingController(text: value);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (val) {
        widget.controller.add(val);
        setState(() {
          value = val;
        });
      },
    );
  }
}
