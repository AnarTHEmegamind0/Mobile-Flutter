void createUser(String name, int age, {bool isActive = true}) {
  print("User: $name, Age: $age, Active: $isActive");
}

void main() {
  createUser("Lebron James", 38); 
  createUser("Stephen Curry", 35, isActive: false); 
}