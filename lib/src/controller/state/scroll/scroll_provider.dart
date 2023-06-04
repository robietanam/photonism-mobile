import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollPositionNotifier extends StateNotifier<double> {
  ScrollPositionNotifier() : super(0.0);

  void updateScrollPosition(double newPosition) {
    print("NEW : ${newPosition}");
    state = newPosition;
  }
}

final scrollPositionProvider =
    StateNotifierProvider<ScrollPositionNotifier, double>(
        (ref) => ScrollPositionNotifier());
