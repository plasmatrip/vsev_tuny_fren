// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientAdapter extends TypeAdapter<Client> {
  @override
  final int typeId = 2;

  @override
  Client read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Client(
      name: fields[0] as String,
      middleName: fields[1] as String,
      surname: fields[2] as String,
      phone: fields[3] as String,
      telegram: fields[4] as String,
      email: fields[5] as String,
      comment: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Client obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.middleName)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.telegram)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
