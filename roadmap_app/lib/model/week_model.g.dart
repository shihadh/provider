// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeekModelAdapter extends TypeAdapter<WeekModel> {
  @override
  final int typeId = 0;

  @override
  WeekModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeekModel(
      name: fields[0] as String?,
      topics: (fields[1] as List?)?.cast<TopicModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeekModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.topics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
