import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class EditorPage extends StatefulWidget {
  static final routePath = '/notes/editor';

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  FocusNode _focusNode;

  ZefyrController _controller;

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert('\n');
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Nota'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: _saveDocument)
        ],
      ),
      body: ZefyrScaffold(
        child: ZefyrEditor(
          padding: EdgeInsets.all(16),
          controller: _controller,
          focusNode: _focusNode,
        ),
      ),
    );
  }

  void _saveDocument() {
    final contents = jsonEncode(_controller.document);

    print(contents);
  }
}
