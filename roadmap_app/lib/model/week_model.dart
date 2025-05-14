import 'package:hive_flutter/adapters.dart';
import 'package:roadmap_app/model/topic_model.dart';
part 'week_model.g.dart';

@HiveType(typeId: 0)

class WeekModel {

  @HiveField(0)
   String? name;

   @HiveField(1)
   List<TopicModel>? topics;

   WeekModel({
    required this.name,
    required this.topics
   });
}