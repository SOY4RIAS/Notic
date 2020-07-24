import 'package:client_commerce/database/app_database.dart';
import 'package:client_commerce/modules/notes/notes.model.dart';

import 'package:sembast/sembast.dart';

class NotesRepository {
  static const String NOTES_STORE_NAME = 'notes';

  final _notesStore = stringMapStoreFactory.store(NOTES_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<List<NoteModel>> getAll() async {
    final notesSnapshot = await _notesStore.find(await _db);

    return notesSnapshot.reversed
        .map((snapshot) => NoteModel.fromMap(snapshot.value, snapshot.key))
        .toList();
  }

  Future<String> add(String list, NoteModel note) async {
    note.list = list;

    return _notesStore.add(await _db, note.toMap());
  }
}
