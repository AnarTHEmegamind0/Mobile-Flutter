void collectionExamples() {
  // 4.1 Map with name and phone
  Map<String, String> contact = {
    "name": "Alice",
    "phone": "1234567890"
  };

  var longKeys = contact.keys.where((key) => key.length > 4);
  print("Keys with length > 4: $longKeys");
}
