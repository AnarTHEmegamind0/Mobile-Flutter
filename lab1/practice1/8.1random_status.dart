import 'dart:math';

int? generateRandom() {

  return Random().nextBool() ? 100 : null;
}

void main() {

  int status = generateRandom() ?? 0;

  print('Status: $status');
}
