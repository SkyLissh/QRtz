import "package:hive/hive.dart";
import "package:state_notifier/state_notifier.dart";

import "package:qr_scanner/models/models.dart";

class ScannedState {
  final List<QRScanned> scanned;

  ScannedState(this.scanned);
}

class ScannedNotifier extends StateNotifier<ScannedState> with LocatorMixin {
  static final _scannedBox = Hive.box<QRScanned>("scanned");
  static final _initData = _scannedBox.values.toList();

  ScannedNotifier() : super(ScannedState(_initData));

  void add(String data) {
    final scanned = QRScanned.fromData(data);

    _scannedBox.put(scanned.id, scanned);
    state = ScannedState([...state.scanned, scanned]);
  }

  void remove(String id) {
    _scannedBox.delete(id);
    state = ScannedState(state.scanned.where((item) => item.id != id).toList());
  }

  void clear() {
    _scannedBox.clear();
    state = ScannedState([]);
  }
}
