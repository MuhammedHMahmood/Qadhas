import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Qadhas',
      home: MyHomePage(title: 'Qadhas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class Counter {
  int value = 0;
  String name = "";
  Counter(String name) {
    this.name = name;
  }
  Future<void> _incrementValue() async {
    final prefs = await SharedPreferences.getInstance();
      value = (prefs.getInt(name) ?? 0) + 1;
      prefs.setInt(name, value);
  }

  Future<void> _decrementValue() async {
    final prefs = await SharedPreferences.getInstance();
    value = (prefs.getInt(name) ?? 0) - 1;
    prefs.setInt(name, value);
  }
  Future<void> _setValue(int newValue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(name, newValue);
  }
  Future<void> _loadCounter() async {
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

class _MyHomePageState extends State<MyHomePage> {
  Counter _fajrCounter  = Counter('fajrCounter');
  Counter _zuhurCounter  = Counter('zuhurCounter');
  Counter _asrCounter  = Counter('asrCounter');
  Counter _maghribCounter  = Counter('maghribCounter');
  Counter _ishaCounter  = Counter('ishaCounter');
  Counter _witrCounter  = Counter('witrCounter');


  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  Future<void> _loadCounter() async {
    _fajrCounter._loadCounter();
    _zuhurCounter._loadCounter();
    _asrCounter._loadCounter();
    _maghribCounter._loadCounter();
    _ishaCounter._loadCounter();
    _witrCounter._loadCounter();
  }
  // TODO: textfield for counters on submit should update the counter value.
  // TODO: Need to fix spacing so textboxes and buttons are aligned.
  // TODO: Need to clean up main file, maybe figure out a way to write this cleaner. Perhaps put all counters into an array,
  //        then iterate over the array and create a row for each counter instead of six individual rows
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: [
                Text('Fajr '),
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '$_fajrCounter',
                    ),
                  ),
                ),
                TextButton(onPressed: () {setState(() {_fajrCounter._decrementValue();});}, child: const Icon(Icons.remove)),
                TextButton(onPressed: () {setState(() {_fajrCounter._incrementValue();});}, child: const Icon(Icons.add)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: [
                Text('Zuhur'),
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '$_zuhurCounter',
                    ),
                  ),
                ),
                TextButton(onPressed: () {setState(() {_zuhurCounter._decrementValue();});}, child: const Icon(Icons.remove)),
                TextButton(onPressed: () {setState(() {_zuhurCounter._incrementValue();});}, child: const Icon(Icons.add))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: [
                Text('Asr'),
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '$_asrCounter',
                    ),
                  ),
                ),
                TextButton(onPressed: () {setState(() {_asrCounter._decrementValue();});}, child: const Icon(Icons.remove)),
                TextButton(onPressed: () {setState(() {_asrCounter._incrementValue();});}, child: const Icon(Icons.add))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: [
                Text('Maghrib'),
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '$_maghribCounter',
                    ),
                  ),
                ),
                TextButton(onPressed: () {setState(() {_maghribCounter._decrementValue();});}, child: const Icon(Icons.remove)),
                TextButton(onPressed: () {setState(() {_maghribCounter._incrementValue();});}, child: const Icon(Icons.add))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: [
                Text('Isha'),
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '$_ishaCounter',
                    ),
                  ),
                ),
                TextButton(onPressed: () {setState(() {_ishaCounter._decrementValue();});}, child: const Icon(Icons.remove)),
                TextButton(onPressed: () {setState(() {_ishaCounter._incrementValue();});}, child: const Icon(Icons.add))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: [
                Text('Witr'),
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '$_witrCounter',
                    ),
                  ),
                ),
                TextButton(onPressed: () {setState(() {_witrCounter._decrementValue();});}, child: const Icon(Icons.remove)),
                TextButton(onPressed: () {setState(() {_witrCounter._incrementValue();});}, child: const Icon(Icons.add))
              ],
            ),
          ],
        ),
      ),
    );
  }
}