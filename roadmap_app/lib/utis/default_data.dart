import 'package:roadmap_app/model/topic_model.dart';
import 'package:roadmap_app/model/week_model.dart';

final List<WeekModel> defaultData=[
  WeekModel(
    name: 'week 1',
    topics: [
    TopicModel(
      tittle: 'Dart Basic', 
      isdone: false, 
      description: '''
      - What is Dart?
      - Study everything about dart 
      '''
      )
    ]
  )
];