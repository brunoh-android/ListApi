import 'package:exemplo/member.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class GitFluState extends State<GitFluWidget> {
  var _members = <Member>[];
  final _front = const TextStyle(fontSize: 20.0);

  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    String url = "https://api.github.com/orgs/adobe/members";
    http.Response response = await http.get(url);
    setState(() {
      final membersJSON = jsonDecode(response.body);

      for (var member in membersJSON) {
        _members.add(Member(member["login"], member["avatar_url"]));
      }
      print(_members);
    });
  }

  Widget _buildRow(int position) {
    return ListTile(
      title: Text("${_members[position].login}", style: _front),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(_members[position].avatarUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _members.length,
      itemBuilder: (BuildContext context, int position) {
        return _buildRow(position);
      },
    );
  }
}

class GitFluWidget extends StatefulWidget {
  @override
  createState() => GitFluState();
}
