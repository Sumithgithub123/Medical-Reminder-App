// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final int typeId = 1;

  @override
  Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model(
      name: fields[1] as String,
      dose: fields[2] as String,
      idd: fields[0] as int?,
      timeset: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idd)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dose)
      ..writeByte(3)
      ..write(obj.timeset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Model1Adapter extends TypeAdapter<Model1> {
  @override
  final int typeId = 2;

  @override
  Model1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model1(
      profilename: fields[0] as String,
      id1: fields[2] as int?,
      age: fields[1] as String,
      doctorname: fields[3] as String,
      docphonenum: fields[4] as String,
      gender: fields[5] as String,
      weight: fields[7] as String,
      height: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Model1 obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.profilename)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.id1)
      ..writeByte(3)
      ..write(obj.doctorname)
      ..writeByte(4)
      ..write(obj.docphonenum)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Model1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
