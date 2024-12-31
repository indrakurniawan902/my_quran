// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doa_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoaLocalModelAdapter extends TypeAdapter<DoaLocalModel> {
  @override
  final int typeId = 3;

  @override
  DoaLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoaLocalModel(
      id: fields[0] as String,
      doa: fields[1] as String,
      ayat: fields[2] as String,
      latin: fields[3] as String,
      artinya: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DoaLocalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.doa)
      ..writeByte(2)
      ..write(obj.ayat)
      ..writeByte(3)
      ..write(obj.latin)
      ..writeByte(4)
      ..write(obj.artinya);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoaLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
