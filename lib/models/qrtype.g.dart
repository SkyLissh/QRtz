// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrtype.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QRTypeAdapter extends TypeAdapter<QRType> {
  @override
  final int typeId = 1;

  @override
  QRType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QRType.text;
      case 1:
        return QRType.url;
      case 2:
        return QRType.email;
      case 3:
        return QRType.phone;
      case 4:
        return QRType.sms;
      case 5:
        return QRType.wifi;
      case 6:
        return QRType.geo;
      case 7:
        return QRType.contact;
      case 8:
        return QRType.calendar;
      case 9:
        return QRType.unknown;
      case 10:
        return QRType.instagram;
      case 11:
        return QRType.facebook;
      case 12:
        return QRType.twitter;
      case 13:
        return QRType.linkedin;
      case 14:
        return QRType.youtube;
      case 15:
        return QRType.github;
      case 16:
        return QRType.twitch;
      default:
        return QRType.text;
    }
  }

  @override
  void write(BinaryWriter writer, QRType obj) {
    switch (obj) {
      case QRType.text:
        writer.writeByte(0);
        break;
      case QRType.url:
        writer.writeByte(1);
        break;
      case QRType.email:
        writer.writeByte(2);
        break;
      case QRType.phone:
        writer.writeByte(3);
        break;
      case QRType.sms:
        writer.writeByte(4);
        break;
      case QRType.wifi:
        writer.writeByte(5);
        break;
      case QRType.geo:
        writer.writeByte(6);
        break;
      case QRType.contact:
        writer.writeByte(7);
        break;
      case QRType.calendar:
        writer.writeByte(8);
        break;
      case QRType.unknown:
        writer.writeByte(9);
        break;
      case QRType.instagram:
        writer.writeByte(10);
        break;
      case QRType.facebook:
        writer.writeByte(11);
        break;
      case QRType.twitter:
        writer.writeByte(12);
        break;
      case QRType.linkedin:
        writer.writeByte(13);
        break;
      case QRType.youtube:
        writer.writeByte(14);
        break;
      case QRType.github:
        writer.writeByte(15);
        break;
      case QRType.twitch:
        writer.writeByte(16);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QRTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
