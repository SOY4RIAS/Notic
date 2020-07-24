import 'dart:convert';
import 'dart:math';

import 'package:client_commerce/modules/notes/notes.controller.dart';
import 'package:client_commerce/modules/notes/notes.model.dart';
import 'package:client_commerce/widgets/prompt_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          IconButton(icon: Icon(Icons.save), onPressed: _confirmSaveDialog)
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

  _confirmSaveDialog() {
    String listName;

    Get.dialog(PromptDialog(
      onChange: (list) => listName = list,
      onClose: () => _saveDocument(listName),
    ));
  }

  void _saveDocument(String list) {
    final contents = jsonEncode(_controller.document);

    final plainContent = _controller.document.toPlainText().split('\n');
    final endSlice = plainContent.length < 5 ? plainContent.length : 5;

    final summary = plainContent.sublist(1, endSlice);

    final note = NoteModel(
      title: plainContent[0],
      content: contents,
      summary: summary.join('\n'),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastAction: LastActions.CREATE,
    );

    Get.find<NotesController>().createNote(
      list: list,
      note: note,
    );

    Get.back();
  }
}
