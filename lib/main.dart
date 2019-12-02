import 'package:flutter/material.dart';

import 'Game.dart';

const String testDevice = "Mobile_id";

void main() {


  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Game())
  );
}
