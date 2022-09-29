import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class Notes extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;

  Notes({this.title, this.description});
}
