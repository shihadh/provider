import 'package:hive_flutter/adapters.dart';
part 'topic_model.g.dart';

  @HiveType(typeId: 0)

class TopicModel {

    @HiveField(0)
    String? tittle;

    @HiveField(1)
    bool? isdone;

    @HiveField(2)
    String? description;

    TopicModel({
      required this.tittle,
      required this.isdone,
      required this.description
    });

  }
