// The reducer, which takes the previous count and increments it in response
// to an Increment action.
import 'package:flutter_counter/redux/counter_actions.dart';

int counterReducer(int state, dynamic action) {
  if (action == CounterActions.Increment) {
    return state + 1;
  }

  return state;
}