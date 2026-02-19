import 'package:chathub/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AddNoteView extends StatelessWidget {

  final int? index;
  AddNoteView({this.index});

  final controller = Get.find<NoteController>();

  final title = TextEditingController();
  final desc = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(index != null){
      final note = controller.notes[index!];
      title.text = note.title;
      desc.text = note.description;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: title),
            TextField(controller: desc),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                if(index == null){
                  controller.addNote(title.text, desc.text);
                }else{
                  controller.updateNote(index!, title.text, desc.text);
                }
                Get.back();
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
