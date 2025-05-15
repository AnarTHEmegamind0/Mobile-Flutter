import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubid.dart';
import 'counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubid(0),
      child: CounterView(),
    );
  }
}
