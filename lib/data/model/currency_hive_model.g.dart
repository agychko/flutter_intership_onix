// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyHiveModelAdapter extends TypeAdapter<CurrencyHiveModel> {
  @override
  final int typeId = 1;

  @override
  CurrencyHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyHiveModel(
      id: fields[0] as int,
      flag: fields[1] as String,
      icon: fields[2] as String,
      name: fields[3] as String,
      symbol: fields[4] as String,
      rate: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.flag)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.symbol)
      ..writeByte(5)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
