import "package:state_notifier/state_notifier.dart";

class PageState {
  final int page;

  PageState(this.page);
}

class PageNotifier extends StateNotifier<PageState> with LocatorMixin {
  PageNotifier() : super(PageState(0));

  void setPage(int page) => state = PageState(page);
}
