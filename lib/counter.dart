part of 'main.dart';

class Counter {
  int value = 0;
  String name = "";
  var valueController = TextEditingController();
  Counter(String name) {
    this.name = name;
  }
  Future<void> incrementValue() async {
    final prefs = await SharedPreferences.getInstance();
    value = (prefs.getInt(name) ?? 0) + 1;
    prefs.setInt(name, value);
  }

  Future<void> decrementValue() async {
    final prefs = await SharedPreferences.getInstance();
    value = (prefs.getInt(name) ?? 0) - 1;
    prefs.setInt(name, value);
  }
  Future<void> setValue(int newValue) async {
    final prefs = await SharedPreferences.getInstance();
    value = newValue;
    prefs.setInt(name, value);
  }
  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    value = (prefs.getInt(name) ?? 0);
  }
  int getValue() {
    return value;
  }
  @override
  String toString() {
    return"$value";
  }
}