import 'package:flutter/material.dart';
import 'etc/ch5_exam_1.dart';

class Homework9 extends StatefulWidget {
  const Homework9({Key? key}) : super(key: key);

  @override
  State<Homework9> createState() => _Homework9State();
}

class _Homework9State extends State<Homework9> {
  String data = "";

  @override
  void initState() {
    super.initState();

    initData();
  }

  Future initData() async {
    data = await getData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuild 예제'),
      ), //AppBar
      body: Column(
        children: [
          Text(
            data,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 3));

    return exam1.toString();
  }
}
