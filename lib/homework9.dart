import 'package:flutter/material.dart';

import 'etc/ch5_exam_1.dart';

class Homework9 extends StatelessWidget {
  const Homework9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuild 예제'),
      ), //AppBar
      body: const Center(
        child: Text(
          "결과가 나올 부분",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getData() async {
    await Future.delayed(const Duration(seconds: 3));

    Map<String, dynamic> data = exam1;

    return data;
  }
}
