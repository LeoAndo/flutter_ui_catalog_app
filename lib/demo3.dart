import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Demo3 extends StatefulWidget {
  const Demo3({super.key});

  @override
  State<Demo3> createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  late Future<List<String>> _dateTimeList;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    print('IN, initState'); //ログ出力
    _dateTimeList = _prefs.then((SharedPreferences prefs) {
      // SharedPreferencesでキーを指定して値を取り出す
      // 値が取得できなければ、空のデータ_nameListに代入する
      return prefs.getStringList('key') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SharedPreferences Demo")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Column(
          children: <Widget>[
            Expanded(
                child: FutureBuilder<List<String>>(
                    future: _dateTimeList,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<String>> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        print(snapshot.data.toString());
                        final items = snapshot.data ?? [];
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = items[index];
                              return Card(
                                child: ListTile(
                                  title: Text(item),
                                  contentPadding: const EdgeInsets.all(8),
                                ),
                              );
                            });
                      }
                    })),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.large(
            onPressed: () => _add(),
            child: const Text('1件追加'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.large(
            onPressed: () => _remove(),
            child: const Text('1件削除'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.large(
            onPressed: () => _removeAll(),
            child: const Text('全件削除'),
          ),
        ],
      ),
    );
  }

  Future<void> _add() async {
    DateTime nowTime = DateTime.now();
    final SharedPreferences prefs = await _prefs;
    final List<String> items = prefs.getStringList('key') ?? [];
    items.add(nowTime.toString());
    setState(() {
      _dateTimeList = prefs.setStringList('key', items).then((_) => items);
    });
  }

  Future<void> _remove() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> items = prefs.getStringList('key') ?? [];
    items.removeLast();
    setState(() {
      _dateTimeList = prefs.setStringList('key', items).then((_) => items);
    });
  }

  Future<void> _removeAll() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _dateTimeList = prefs.setStringList('key', []).then((_) => []);
    });
  }
}
