
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'note_model.dart';

class NoteController extends GetxController {
  final box = Hive.box<NoteModel>('notes');
  RxList<NoteModel> notes = <NoteModel>[].obs;

  late Stream<BoxEvent> _watcher;

  @override
  void onInit() {
    // Load initial data
    notes.value = box.values.toList();

    // Listen to Hive changes
    _watcher = box.watch();
    _watcher.listen((event) {
      notes.value = box.values.toList();
    });

    super.onInit();
  }

  void addNote(String title, String desc) {
    final note = NoteModel(title: title, description: desc);
    box.add(note); // Hive triggers watch -> notes updated automatically
    Get.back();
  }

  void deleteNote(int index) {
    box.deleteAt(index); // Hive triggers watch
  }

  void updateNote(int index, String title, String desc) {
    final note = box.getAt(index);
    if (note != null) {
      note.title = title;
      note.description = desc;
      note.save(); // Hive triggers watch
      Get.back();
    }
  }
}