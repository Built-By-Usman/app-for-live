import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject{

  NoteModel({required this.title,required this.description});

  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
}