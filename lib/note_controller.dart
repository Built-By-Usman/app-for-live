import 'package:chathub/note_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class NoteController extends GetxController {

  final box = Hive.box<NoteModel>('notes');

  RxList<NoteModel> notes = <NoteModel>[].obs;

  @override
  void onInit() {
    notes.value = box.values.toList();
    super.onInit();
  }

  void addNote(String title, String desc) {
    final note = NoteModel(title: title, description: desc);
    box.add(note);
    notes.add(note);
  }

  void deleteNote(int index) {
    box.deleteAt(index);
    notes.removeAt(index);
  }

  void updateNote(int index, String title, String desc) {
    final note = box.getAt(index);
    note!.title = title;
    note.description = desc;
    note.save();

    notes[index] = note;
  }
}
