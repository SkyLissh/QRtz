import "package:hive/hive.dart";
import "package:state_notifier/state_notifier.dart";

import "package:qr_scanner/models/models.dart";

class HistoryState {
  final List<QRCode> scanned;
  final List<QRCode> generated;

  HistoryState(this.scanned, this.generated);
}

class HistoryNotifier extends StateNotifier<HistoryState> with LocatorMixin {
  static final _historyBox = Hive.box<QRCode>("history");
  static final _history = _historyBox.values.toList();

  static final _scanned = _history.where((e) => e.isScanned).toList();
  static final _generated = _history.where((e) => !e.isScanned).toList();

  HistoryNotifier() : super(HistoryState(_scanned, _generated));

  void add(String data, {bool isScanned = false}) {
    final qr = QRCode.fromData(data, isScanned: isScanned);

    _historyBox.put(qr.id, qr);

    if (isScanned) {
      state = HistoryState([...state.scanned, qr], state.generated);
    } else {
      state = HistoryState(state.scanned, [...state.generated, qr]);
    }
  }

  void remove(String id) {
    _historyBox.delete(id);

    state = HistoryState(
      state.scanned.where((e) => e.id != id).toList(),
      state.generated.where((e) => e.id != id).toList(),
    );
  }

  void clear() {
    _historyBox.clear();

    state = HistoryState([], []);
  }
}
