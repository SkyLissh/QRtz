// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrscanned.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QRScannedAdapter extends TypeAdapter<QRScanned> {
  @override
  final int typeId = 0;

  @override
  QRScanned read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QRScanned(
      id: fields[0] as String,
      data: fields[1] as String,
      type: fields[2] as QRType,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QRScanned obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QRScannedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
