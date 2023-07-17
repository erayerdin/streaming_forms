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

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// {@template formsswitch}
/// A switch with streams.
/// {@endtemplate}
class StreamingSwitch extends StatefulWidget {
  /// {@macro formsswitch}
  const StreamingSwitch({
    //-------------------//
    // Streaming Constructor //
    //-------------------//
    required this.controller,
    this.initialValue = false,
    //---------------------//
    // Flutter Constructor //
    //---------------------//
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.thumbIcon,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    super.key,
  });

  //----------------------//
  // Streaming Properties //
  //----------------------//
  /// StreamController to push the change events to.
  final StreamController<bool> controller;

  /// Initial value of the widget.
  final bool initialValue;

  //--------------------//
  // Flutter Properties //
  //--------------------//
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider<Object>? activeThumbImage;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageProvider<Object>? inactiveThumbImage;
  final ImageErrorListener? onInactiveThumbImageError;
  final MaterialStateProperty<Color?>? thumbColor;
  final MaterialStateProperty<Color?>? trackColor;
  final MaterialStateProperty<Color?>? trackOutlineColor;
  final MaterialStateProperty<Icon?>? thumbIcon;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;

  @override
  State<StreamingSwitch> createState() => _StreamingSwitchState();
}

class _StreamingSwitchState extends State<StreamingSwitch> {
  late bool value;

  @override
  void initState() {
    value = widget.initialValue;
    widget.controller.add(value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: widget.activeColor,
      activeTrackColor: widget.activeTrackColor,
      inactiveThumbColor: widget.inactiveThumbColor,
      inactiveTrackColor: widget.inactiveTrackColor,
      activeThumbImage: widget.activeThumbImage,
      onActiveThumbImageError: widget.onActiveThumbImageError,
      inactiveThumbImage: widget.inactiveThumbImage,
      onInactiveThumbImageError: widget.onInactiveThumbImageError,
      thumbColor: widget.thumbColor,
      trackColor: widget.trackColor,
      trackOutlineColor: widget.trackOutlineColor,
      thumbIcon: widget.thumbIcon,
      materialTapTargetSize: widget.materialTapTargetSize,
      dragStartBehavior: widget.dragStartBehavior,
      mouseCursor: widget.mouseCursor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      overlayColor: widget.overlayColor,
      splashRadius: widget.splashRadius,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      autofocus: widget.autofocus,
      value: value,
      onChanged: (val) {
        widget.controller.add(val);
        setState(() {
          value = val;
        });
      },
    );
  }
}
