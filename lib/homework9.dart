import 'package:flutter/material.dart';
import 'etc/ch5_exam1.dart';
import 'etc/ch5_exam2.dart';


class Homework9 extends StatelessWidget {
  const Homework9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder 예제'),
      ), //AppBar
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              FutureBuilder<String>(
                future: getData(),
                builder: (context, snapshot){
                  if (snapshot.hasError){
                    return const Center(
                      child: Text('에러가 발생했습니다.'),
                    );
                  }

                  if (!snapshot.hasData){
                    return const Center(
                      child: Text('데이터가 없습니다'),
                    );
                  }

                  final String data = snapshot.data!;

                  return SizedBox(
                    child: Text(
                      data,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }),

              FutureBuilder<List<Map<String, dynamic>>>(
                future: getList(),
                builder: (context, snapshot){

                  if (!snapshot.hasData){
                    return const Center(
                      //child: Text('데이터가 없습니다'),
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<Map<String, dynamic>> users = snapshot.data!;

                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> user = users[index];

                      return Text(
                        user['title'],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      );
                    }
                  );
                },
              ),
            ],
          )
        ),
      ),
    );
  }

  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 1));

    return exam1.toString();
  }

  Future<List<Map<String, dynamic>>> getList() async {
    await Future.delayed(const Duration(seconds: 3));

    return exam21;
  }
}
