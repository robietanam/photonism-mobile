import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollPositionNotifier extends StateNotifier<double> {
  ScrollPositionNotifier() : super(0.0);

  void updateScrollPosition(double newPosition) {
    print("NEW : ${newPosition}");
    state = newPosition;
  }

  void resetScrollPosition() {
    state = 0.0;
  }
}

final scrollPositionProvider =
    StateNotifierProvider<ScrollPositionNotifier, double>(
        (ref) => ScrollPositionNotifier());
