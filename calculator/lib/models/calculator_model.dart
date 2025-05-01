import 'package:flutter/foundation.dart';

class CalculatorModel with ChangeNotifier {
  String _display = '0';
  double _firstNumber = 0;
  String _operator = '';
  bool _waitingForSecondNumber = false;

  String get display => _display;

  void input(String value) {
    if (_isDigit(value)) {
      _handleDigit(value);
    } else if (value == '.') {
      _handleDecimal();
    } else if (_isOperator(value)) {
      _handleOperator(value);
    } else if (value == '=') {
      _calculate();
    } else if (value == '()') {
      _handleNegative();
    } else if (value == 'C') {
      _clear();
    }
    notifyListeners();  
  }

  bool _isDigit(String value) => '012345678900'.contains(value);

  bool _isOperator(String value) => '+-*/%'.contains(value);

  void _handleDigit(String digit) {
    if (_display.length > 10) {
      return; // Prevent overflow
    }

    if (_waitingForSecondNumber) {
      _display = digit;
      _waitingForSecondNumber = false;
    } else if (digit == '00') {
      _display = _display == '0' ? '0' : _display + '00';
    } else {
      _display = _display == '0' ? digit : _display + digit;
    }
  }

  void _handleDecimal() {
    if (_waitingForSecondNumber) {
      _display = '0.';
      _waitingForSecondNumber = false;
    } else if (!_display.contains('.')) {
      _display += '.';
    }
  }

  void _handleOperator(String operator) {
    _firstNumber = double.parse(_display);
    _operator = operator;
    _waitingForSecondNumber = true;
  }

  void _handleNegative() {
    if (_display.startsWith('-')) {
      _display = _display.substring(1);
    } else {
      _display = '-' + _display; 
    }
  }

  void _calculate() {
    if (_operator.isEmpty) return;
    double secondNumber = double.parse(_display);
    double result = 0;

    switch (_operator) {
      case '+':
        result = _firstNumber + secondNumber;
        break;
      case '-':
        result = _firstNumber - secondNumber;
        break;
      case '*':
        result = _firstNumber * secondNumber;
        break;
      case '%':
        result = _firstNumber % secondNumber;
        break;
      case '/':
        if (secondNumber != 0) {
          result = _firstNumber / secondNumber;
        } else {
          _display = 'Error'; 
          _operator = '';
          _waitingForSecondNumber = false;
          notifyListeners();
          return;
        }
        break;
      default:
        _display = 'Error';
        notifyListeners();
        return;
    }

    _display = result.toStringAsFixed(2).replaceAll('.00', '');
    _operator = '';
    _waitingForSecondNumber = false;
  }

  void _clear() {
    _display = '0';
    _firstNumber = 0;
    _operator = '';
    _waitingForSecondNumber = false;
  }
}
