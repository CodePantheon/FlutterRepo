import 'package:flutter/material.dart';

import 'NewNoteWidget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static const String TITLE = "Notes";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      home: NewNoteWidget()
    );
  }
}