import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageWidgetProvider = StateNotifierProvider<Pages, int>((ref) {
  return Pages();
});

class Pages extends StateNotifier<int> {
  Pages() : super(0);
  void setPage(int page) => state = page;
}
