import 'package:chathub/note_model.dart';
import 'package:chathub/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
  

  

  runApp(
  ChatHub()
  );
}
class ChatHub extends StatelessWidget {
  const ChatHub({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: Routes.pages,
    );
  }
}
