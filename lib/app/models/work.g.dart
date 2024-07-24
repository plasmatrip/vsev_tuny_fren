// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkAdapter extends TypeAdapter<Work> {
  @override
  final int typeId = 1;

  @override
  Work read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Work(
      name: fields[0] as String,
      comment: fields[1] as String,
      client: (fields[2] as HiveList?)?.castHiveList(),
      employee: (fields[3] as HiveList?)?.castHiveList(),
      date: fields[4] as DateTime?,
      time: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Work obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.client)
      ..writeByte(3)
      ..write(obj.employee)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
