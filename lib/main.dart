import 'package:flutter/material.dart';
import 'package:manana/Api_service.dart';
import 'package:manana/manana_list.dart';
import 'package:manana/manana_model.dart';

void main() {
  runApp(const manana());
}

class manana extends StatelessWidget {
  const manana({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: ApiService().getMananaApi(),
          builder: (context, snapshot) {
            print('jfjhg: ${snapshot.hasData}');
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text('helloManana $index'),
                  );
                },
              );
            } else {
              return const Text('오류');
            }
          },
        ),
      ),
    );
  }
}
