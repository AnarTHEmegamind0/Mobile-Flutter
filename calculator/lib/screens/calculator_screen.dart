import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/calculator_model.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final List<String> buttons = [
    'C', '()', '%', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '00', '0', '.', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: [
          _buildDisplay(context),
          const SizedBox(height:90),
          _buildButtonGrid(context),
        ],
      ),
    );
  }

  Widget _buildDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerRight,
      height: 100,
      color: Colors.white,
      child: Consumer<CalculatorModel>(
        builder: (context, model, child) {
          return Text(
            model.display,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          );
        },
      ),
    );
  }

  Widget _buildButtonGrid(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: buttons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          if (buttons[index].isEmpty) {
            return const SizedBox.shrink();
          }
          return _buildButton(context, buttons[index]);
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _getButtonColor(text),
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Provider.of<CalculatorModel>(context, listen: false).input(text);
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Color _getButtonColor(String text) {
    if (text == 'C') return Colors.black54;
    if (_isOperator(text) || text == '=') return Colors.black54;
    if (text == '()' || text == '%') return Colors.black54;
    return Colors.grey;
  }

  bool _isOperator(String text) => '+-*/'.contains(text);
}