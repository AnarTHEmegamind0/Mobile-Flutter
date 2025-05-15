// cupid is simflified version of Bloc
// 

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubid extends Cubit<int> {
  
  CounterCubid(super.initialState);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}