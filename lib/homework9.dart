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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<String>(
                future: getData(),
                builder: (context, snapshot){
                  if (snapshot.hasError){
                    return const Center(
                      child: Text('에러가 발생했습니다.'),
                    );
                  }

                  if (!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final String data = snapshot.data!;

                  if (data.isEmpty){
                    return const Center(
                      child: Text('데이터가 크가가 0 입니다.'),
                    );
                  }

                  return SizedBox(
                    child: Text(
                      data,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<List<Map<String, dynamic>>>(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 1));

    return exam1.toString();

    //throw Exception('Error!!');
    //return '';
  }

  Future<List<Map<String, dynamic>>> getList() async {
    await Future.delayed(const Duration(seconds: 3));

    return exam21;
  }
}
