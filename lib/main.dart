//@dart=2.9
import 'package:exemplo/mywidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(GitFluApp());

class GitFluApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GitFlu",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Titulo do App"),
        ),
        body: Center(
          child: GitFluWidget(),
        ),
      ),
    );
  }
}
