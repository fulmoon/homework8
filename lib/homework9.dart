import 'package:flutter/material.dart';
import 'etc/ch5_exam1.dart';
import 'etc/ch5_exam2.dart';


class Homework9 extends StatefulWidget {
  const Homework9({Key? key}) : super(key: key);

  @override
  State<Homework9> createState() => _Homework9State();
}

class _Homework9State extends State<Homework9> {
  String data = '';

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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: getList(),
                      builder: (context, snapshot){
                        if (snapshot.hasError){
                          return const Center(
                            child: Text('에러가 발생했습니다.'),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.waiting){
                          const CircularProgressIndicator();
                        }

                        if (!snapshot.hasData){
                          return const Center(
                            child: Text('데이터가 없습니다'),
                          );
                        }

                        final List<Map<String, dynamic>> users = snapshot.data!;

                        return ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            if (users.isEmpty) {
                              const CircularProgressIndicator();
                            }
                            Map<String, dynamic> user = users[index];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                user['title'],
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            );
                          }
                        );
                      },
                    ),
                  )
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
/*
  Future<List<Exam2Title>> getList() async {
    await Future.delayed(const Duration(seconds: 3));

    String jsonString = exam2;

    Exam2Title exam21 = jsonDecode(jsonString);

    Iterable temp = [exam21];

    List<Exam2Title> result = temp.map((e) => Exam2Title.fromJson(e)).toList();

    return result;
  }*/

  Future<List<Map<String, dynamic>>> getList() async {
    await Future.delayed(const Duration(seconds: 3));

    return exam21;
  }
}
