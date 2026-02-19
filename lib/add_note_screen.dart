// add_note_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'note_controller.dart';

class AddNoteView extends StatefulWidget {
  final int? index;
  AddNoteView({this.index, super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final controller = Get.put(NoteController());
  late TextEditingController title;
  late TextEditingController desc;

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    desc = TextEditingController();

    if (widget.index != null) {
      final note = controller.notes[widget.index!];
      title.text = note.title;
      desc.text = note.description;
    }
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? "Add Note" : "Update Note"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                labelText: "Title",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: desc,
              decoration: InputDecoration(
                labelText: "Description",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(widget.index == null ? Icons.add : Icons.update),
                label: Text(
                  widget.index == null ? "Add Note" : "Update Note",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final t = title.text.trim();
                  final d = desc.text.trim();
                  if (t.isEmpty || d.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please fill both fields",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red[300],
                      colorText: Colors.white,
                    );
                    return;
                  }

                  if (widget.index == null) {
                    controller.addNote(t, d);
                    Get.snackbar(
                      "Success",
                      "Note added",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green[300],
                      colorText: Colors.white,
                    );
                  } else {
                    controller.updateNote(widget.index!, t, d);
                    Get.snackbar(
                      "Updated",
                      "Note updated successfully",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green[300],
                      colorText: Colors.white,
                    );
                  }
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}