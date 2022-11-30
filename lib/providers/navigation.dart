import "package:state_notifier/state_notifier.dart";

class NavState {
  final int tab;
  final int page;

  NavState(this.tab, this.page);
}

class NavNotifier extends StateNotifier<NavState> with LocatorMixin {
  NavNotifier() : super(NavState(0, 0));

  void setTab(int tab) => state = NavState(tab, state.page);
  void setPage(int page) => state = NavState(state.tab, page);
}
