
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_note_screen.dart';
import 'note_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatHub",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return Center(
            child: Text(
              "No notes yet. Tap + to add one!",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: controller.notes.length,
          itemBuilder: (_, i) {
            final note = controller.notes[i];
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                title: Text(
                  note.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(note.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => Get.to(() => AddNoteView(index: i)),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDelete(i),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => Get.to(() => AddNoteView()),
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  void _confirmDelete(int index) {
    Get.defaultDialog(
      title: "Delete Note?",
      middleText: "Are you sure you want to delete this note?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () {
        controller.deleteNote(index);
        Get.back();
        Get.snackbar(
          "Deleted",
          "Note has been deleted",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[300],
          colorText: Colors.white,
        );
      },
    );
  }
}