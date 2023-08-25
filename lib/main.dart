import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'counter.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  static Counter _fajrCounter  = Counter('Fajr');
  static Counter _zuhurCounter  = Counter('Zuhur');
  static Counter _asrCounter  = Counter('Asr');
  static Counter _maghribCounter  = Counter('Maghrib');
  static Counter _ishaCounter  = Counter('Isha');
  static Counter _witrCounter  = Counter('Witr');
  List<Counter> counters = [_fajrCounter,_zuhurCounter,_asrCounter,_maghribCounter,_ishaCounter,_witrCounter];

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }
  //Loading counter value on start
  Future<void> _loadCounter() async {
    for (var counter in counters) {
      await counter.loadCounter();
      setState(() { });
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadCounter();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Table (border: TableBorder(),
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(64),
            3: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            for (var counter in counters) TableRow(children: [
              TableCell(
                child: Container(padding:EdgeInsets.only(left:15.0),child:Text(counter.name)),
              ),
              TableCell(
                child: TextButton(onPressed: () {setState(() {counter.decrementValue();});}, child: const Icon(Icons.remove)),
              ),
              TableCell(
                child: TextField(
                  controller: counter.valueController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Center(child: Text('$counter')),
                  ),
                  onSubmitted: (String value) async {
                    setState(() {
                      try {
                        counter.setValue(int.parse(value));
                      }
                      catch(error){}
                      counter.valueController.clear();
                      FocusScope.of(context).unfocus();
                    });
                  },
                ),
              ),
              TableCell(
                child: TextButton(onPressed: () {setState(() {counter.incrementValue();});}, child: const Icon(Icons.add)),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}