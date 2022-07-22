import 'dart:convert';

import 'package:flutter/material.dart';
import 'etc/ch5_exam1.dart';
import 'etc/ch5_exam2.dart';
//import 'etc/ch5_exam2_string.dart';

class Homework9 extends StatefulWidget {
  const Homework9({Key? key}) : super(key: key);

  @override
  State<Homework9> createState() => _Homework9State();
}

class _Homework9State extends State<Homework9> {
  String data = '';
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();

    initData();
  }

  Future initData() async {
    data = await getData();
    users = await getList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder 예제'),
      ), //AppBar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                data.isEmpty
                ? const CircularProgressIndicator()
                : Text(
                  data,
                  style: const TextStyle(fontSize: 20),
                ),
                Expanded(child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    users[index].isEmpty
                    ? const CircularProgressIndicator()
                    : Map<String, dynamic> user = users[index]

                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        user['title'],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  })
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 3));

    return exam1.toString();
  }

  Future<List<Map<String, dynamic>>> getList() async {
    await Future.delayed(const Duration(seconds: 3));

    return exam21;
  }
/*
  Future<List<Map<String, dynamic>>> getList() async {
    await Future.delayed(const Duration(seconds: 3));

    List<Map<String, dynamic>> json = jsonDecode(exam2);

    Iterable exam2 = json;

    return exam2.map((e) => e);
  }*/
}
