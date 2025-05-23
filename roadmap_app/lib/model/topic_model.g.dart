// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TopicModelAdapter extends TypeAdapter<TopicModel> {
  @override
  final int typeId = 1;

  @override
  TopicModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopicModel(
      tittle: fields[0] as String?,
      isdone: fields[1] as bool?,
      description: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TopicModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tittle)
      ..writeByte(1)
      ..write(obj.isdone)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
