import 'package:get/get.dart';
import 'package:meta/meta.dart';

class NotesController extends GetxController {
  final _noteLists = ''.obs;
  set noteLists(value) => this._noteLists.value = value;
  get noteLists => this._noteLists.value;
}
