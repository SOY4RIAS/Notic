import 'package:meta/meta.dart';

enum LastActions { CREATE, EDIT, OPENED, NONE }

class NoteModel {
  String id;
  String title;
  String content;
  String summary;
  DateTime createdAt;
  DateTime updatedAt;
  LastActions lastAction;
  String list;

  NoteModel({
    @required this.title,
    @required this.content,
    @required this.summary,
    this.list,
    this.id,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.lastAction,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'summary': summary,
      'list': list,
      'lastAction': lastAction.index,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  static NoteModel fromMap(Map<String, dynamic> data, String id) {
    LastActions lastAction;

    if (data['lastAction'] == LastActions.CREATE.index) {
      lastAction = LastActions.CREATE;
    } else if (data['lastAction'] == LastActions.EDIT.index) {
      lastAction = LastActions.EDIT;
    } else if (data['lastAction'] == LastActions.OPENED.index) {
      lastAction = LastActions.OPENED;
    } else {
      lastAction = LastActions.NONE;
    }

    return NoteModel(
      title: data['title'],
      content: data['content'],
      summary: data['summary'],
      list: data['list'],
      createdAt: DateTime.fromMicrosecondsSinceEpoch(data['createdAt']),
      updatedAt: DateTime.fromMicrosecondsSinceEpoch(data['updatedAt']),
      lastAction: lastAction,
      id: id,
    );
  }
}
