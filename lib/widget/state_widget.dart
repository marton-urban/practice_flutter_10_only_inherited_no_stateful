import 'package:flutter/material.dart';
import '/model/core_state.dart';

class StateInheritedWidget extends InheritedWidget {
  final CoreState state;

  const StateInheritedWidget({
    super.key,
    required super.child,
    this.state = const CoreState(),
  });

  CoreState incrementCounter() {
    final counter = state.counter + 1;
    return state.copy(counter: counter);
  }

  CoreState setColor(Color backgroundColor) {
    return state.copy(backgroundColor: backgroundColor);
  }

  CoreState setCounter(int counter) {
    return state.copy(counter: counter);
  }

  static of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!;

  // never used in this example
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw UnimplementedError();
  }
}
