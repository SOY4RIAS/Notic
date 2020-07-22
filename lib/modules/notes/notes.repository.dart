import 'package:client_commerce/database/app_database.dart';
import 'package:client_commerce/modules/notes/notes.model.dart';

import 'package:sembast/sembast.dart';

class NotesRepository {
  static const String NOTES_STORE_NAME = 'notes';

  final _notesStore = stringMapStoreFactory.store(NOTES_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  getAll() async {
    return _notesStore.find(await _db).asStream();
  }

  getId(id) {
    return apiClient.getId(id);
  }

  delete(id) {
    return apiClient.delete(id);
  }

  edit(obj) {
    return apiClient.edit(obj);
  }

  add(obj) {
    return apiClient.add(obj);
  }
}
