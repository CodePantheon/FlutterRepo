import 'package:flutter/material.dart';

class NewNoteWidget extends StatelessWidget
{
  static const String TITLE = "Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TITLE)),
      body: _buildPageBody(),
    );
  }

  Widget _buildPageBody() {
    String title;
    String content;

    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child:Column(children: <Widget>[
        TextField(
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          decoration: InputDecoration(hintText: "New Note"),
          onChanged: (text) => title = text
        ),
        Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:TextField(
          autofocus: true,
          decoration: null,
            style: TextStyle(fontSize: 18),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (text) => content = text
        ))
      ]));
  }
}