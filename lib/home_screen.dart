import 'package:chathub/add_note_screen.dart';
import 'package:chathub/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Notes")),
      body: Obx(() => ListView.builder(
        itemCount: controller.notes.length,
        itemBuilder: (_, i) {
          final note = controller.notes[i];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => controller.deleteNote(i),
            ),
            onTap: () => Get.to(AddNoteView(index: i)),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddNoteView()),
        child: Icon(Icons.add),
      ),
    );
  }
}
