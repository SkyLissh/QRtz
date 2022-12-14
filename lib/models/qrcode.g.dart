// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrcode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QRCodeAdapter extends TypeAdapter<QRCode> {
  @override
  final int typeId = 0;

  @override
  QRCode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QRCode(
      id: fields[0] as String,
      data: fields[1] as String,
      type: fields[2] as QRType,
      date: fields[3] as DateTime,
      isScanned: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, QRCode obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.isScanned);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QRCodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
