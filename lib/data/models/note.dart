import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class Note {
  String id;
  String title;
  String content;
  String summaryContent;
  String author;

  Note({
    @required this.title,
    @required this.content,
    this.summaryContent,
    @required this.author,
    this.id,
  }) {
    if (this.id == null) {
      this.id = Uuid().v1();
    }
  }
}

class NoteList {
  String name;
  String id;
  List<Note> _notes;

  NoteList({this.id, List<Note> notes = const []}) {
    if (this.id == null) {
      this.id = Uuid().v1();
    }

    this._notes = notes;
  }

  append(Note note) {
    this._notes.add(note);
  }

  Note findById(String id) {
    return this._notes.firstWhere((note) => note.id == id);
  }

  remove(String id) {
    this._notes.removeWhere((note) => note.id == id);
  }

  get notes => this._notes;
}
