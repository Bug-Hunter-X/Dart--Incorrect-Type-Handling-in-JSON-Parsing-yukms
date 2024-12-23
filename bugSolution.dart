```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      for (var item in data) {
        // Correct type handling with null checks
        final String? name = item['name']?.toString();
        if(name != null){
          print(name);
        } else {
          print('Name field is missing for this item.');
        }
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```