import "package:uuid/uuid.dart";
import "package:hive_flutter/hive_flutter.dart";

import "package:qr_scanner/models/models.dart";

class HiveDB {
  static final _today = DateTime.now();

  static const _uuid = Uuid();
  static final _uuids = List.generate(10, (_) => _uuid.v4());

  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(QRTypeAdapter());
    Hive.registerAdapter(QRScannedAdapter());

    // Open boxes
    await Hive.openBox<QRScanned>("scanned");

    // Seed Database
    await _seed();
  }

  static Future<void> _seed() async {
    final scanned = Hive.box<QRScanned>("scanned");

    if (scanned.isNotEmpty) return;

    scanned.put(
        _uuids[9],
        QRScanned(
          id: _uuids[9],
          data: "https://lock.skylissh.live/",
          type: QRType.url,
          date: _today,
        ));

    scanned.put(
        _uuids[0],
        QRScanned(
          id: _uuids[0],
          data: "https://www.linkedin.com/in/alisson-hernandez/",
          type: QRType.linkedin,
          date: _today,
        ));

    scanned.put(
        _uuids[1],
        QRScanned(
          id: _uuids[1],
          data: "https://github.com/skylissh",
          type: QRType.github,
          date: _today,
        ));

    scanned.put(
        _uuids[2],
        QRScanned(
          id: _uuids[2],
          data: "https://instagram.com/skylissh",
          type: QRType.instagram,
          date: _today.subtract(const Duration(days: 1)),
        ));

    scanned.put(
        _uuids[3],
        QRScanned(
          id: _uuids[3],
          data: "https://twitch.tv/skylissh",
          type: QRType.twitch,
          date: _today.subtract(const Duration(days: 1)),
        ));

    scanned.put(
        _uuids[4],
        QRScanned(
          id: _uuids[4],
          data: "https://twitter.com/skylissh",
          type: QRType.twitter,
          date: _today.subtract(const Duration(days: 4)),
        ));

    scanned.put(
        _uuids[5],
        QRScanned(
          id: _uuids[5],
          data: "https://youtube.com/skylissh",
          type: QRType.youtube,
          date: _today.subtract(const Duration(days: 4)),
        ));

    scanned.put(
        _uuids[6],
        QRScanned(
          id: _uuids[6],
          data: "geo:37.4429964,-122.1545229?q=Google+Plex",
          type: QRType.geo,
          date: _today.subtract(const Duration(days: 15)),
        ));

    scanned.put(
        _uuids[7],
        QRScanned(
          id: _uuids[7],
          data: "Hi, my name is Alisson Lopez and I'm a Flutter Developer",
          type: QRType.text,
          date: DateTime(2003, 7, 13),
        ));

    scanned.put(
        _uuids[8],
        QRScanned(
          id: _uuids[8],
          data: "mailto:skylissh@gmail.com",
          type: QRType.email,
          date: _today.subtract(const Duration(days: 15)),
        ));
  }
}
