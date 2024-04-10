// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_vonage_opentok/flutter_vonage_opentok.dart';
import 'package:flutter_vonage_opentok_platform_interface/flutter_vonage_opentok_platform_interface.dart';
import 'package:flutter_vonage_opentok_web/flutter_vonage_opentok_web.dart';

class VonageCall extends StatefulWidget {
  const VonageCall({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<VonageCall> createState() => _VonageCallState();
}

class _VonageCallState extends State<VonageCall> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
