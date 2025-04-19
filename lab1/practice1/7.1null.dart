int getValueOrDefault(int? value) {
  return value ?? 0;
}

void main() {
  print(getValueOrDefault(null)); 
  print(getValueOrDefault(10));   
}