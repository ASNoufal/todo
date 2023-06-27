import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'model.g.dart';

var uuid = const Uuid();

@HiveType(typeId: 1)
class Model {
  Model({required this.subtitles, required this.titles}) : id = uuid.v4();
  @HiveField(0)
  String titles;
  @HiveField(1)
  String subtitles;
  @HiveField(2)
  String id;
}

late Box box;
