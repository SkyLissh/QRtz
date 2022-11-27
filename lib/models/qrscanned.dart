import "package:hive/hive.dart";
import "package:uuid/uuid.dart";

import "package:qr_scanner/models/models.dart";

part "qrscanned.g.dart";

const _uuid = Uuid();

@HiveType(typeId: 0)
class QRScanned {
  @HiveField(0)
  String id;

  @HiveField(1)
  String data;

  @HiveField(2)
  QRType type;

  @HiveField(3)
  DateTime date;

  QRScanned(
      {required this.id,
      required this.data,
      required this.type,
      required this.date});

  factory QRScanned.fromData(String data) {
    return QRScanned(
        id: _uuid.v4(),
        data: data.replaceFirst("www.", ""),
        type: _typeFromData(data),
        date: DateTime.now());
  }

  static QRType _typeFromData(String data) {
    final url = Uri.tryParse(data);

    if (url == null) return QRType.unknown;
    if (url.scheme.isEmpty) return QRType.text;

    return _typeFromScheme(url);
  }

  static QRType _typeFromScheme(Uri url) {
    final scheme = url.scheme;
    final host = url.host;

    switch (scheme) {
      case "http":
      case "https":
        return _typeFromHost(host);
      case "mailto":
        return QRType.email;
      case "tel":
        return QRType.phone;
      case "smsto":
        return QRType.sms;
      case "geo":
        return QRType.geo;
      case "wifi":
        return QRType.wifi;
      default:
        return QRType.unknown;
    }
  }

  static QRType _typeFromHost(String host) {
    final split = host.split(".");

    switch (split[split.length - 2]) {
      case "instagram":
        return QRType.instagram;
      case "facebook":
        return QRType.facebook;
      case "twitter":
        return QRType.twitter;
      case "linkedin":
        return QRType.linkedin;
      case "youtube":
        return QRType.youtube;
      case "github":
        return QRType.github;
      case "twitch":
        return QRType.twitch;
      default:
        return QRType.url;
    }
  }
}
