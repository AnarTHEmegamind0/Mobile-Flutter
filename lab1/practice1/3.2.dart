double calculateArea({double length = 1, double width = 1}) {
  return length * width;
}

void main() {
  double area = calculateArea(length: 5, width: 10);
  print("Area of the rectangle: $area");
}