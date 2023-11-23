import 'package:flutter/material.dart';

final List<Text> data = [
  const Text(
    "1番目のデータ",
    textAlign: TextAlign.center,
  ),
  const Text(
    "2番目のデータ",
    textAlign: TextAlign.center,
  ),
  const Text(
    "3番目のデータ",
    textAlign: TextAlign.center,
  ),
  const Text(
    "4番目のデータ",
    textAlign: TextAlign.center,
  ),
  const Text(
    "5番目のデータ",
    textAlign: TextAlign.center,
  ),
  const Text(
    "6番目のデータ",
    textAlign: TextAlign.center,
  ),
];

final List<Text> data2 = [
  const Text(
    "1番目のデータ",
    textAlign: TextAlign.center,
  ),
];

class Demo1 extends StatefulWidget {
  const Demo1({super.key});

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("縦横スクロール")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("縦スクロール: データ多い"),
              Container(
                width: 300.0,
                height: 100.0,
                color: Colors.lightBlueAccent,
                child: SingleChildScrollView(
                  child: Column(
                    children: data,
                  ),
                ),
              ),
              const Text("縦スクロール: データ少ない"),
              Container(
                width: 300.0,
                height: 100.0,
                color: Colors.lightBlueAccent,
                child: SingleChildScrollView(
                  child: Column(
                    children: data2,
                  ),
                ),
              ),
              const Text("横スクロール"),
              Container(
                width: 300.0,
                height: 100.0,
                color: Colors.lightGreenAccent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: data,
                  ),
                ),
              ),
              const Text("横スクロール: データ少ない"),
              Container(
                width: 300.0,
                height: 100.0,
                color: Colors.lightGreenAccent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: data2,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
