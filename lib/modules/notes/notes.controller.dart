import 'package:client_commerce/modules/notes/notes.model.dart';
import 'package:client_commerce/modules/notes/notes.repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:sembast/sembast.dart';

class NotesController extends GetxController {
  NotesRepository _notesRepository;

  NotesController() {
    _notesRepository = NotesRepository();
  }

  /// returns its generated id
  Future<String> createNote({String list, NoteModel note}) {
    return _notesRepository.add(list, note);
  }

  Stream<List<NoteModel>> getNotes() {
    return _notesRepository.getAll().asStream();
  }
}
