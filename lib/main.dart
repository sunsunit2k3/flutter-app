import 'package:flutter/material.dart';
import './my_object.dart';

void main() {
  runApp(const MyApp());
}

// Thay vì sử dụng _value trong class MyAppState, ta sử dụng _myObject để dễ dàng kiểm soát giá trị.
// Điều này giúp trong việc tái sử dụng (_myObject có thể sử dụng nhiều lần trong dự án) và mở rộng (thêm chức năng mới).
// Có tính logic cao, dễ dàng đọc hơn, dễ dàng kiểm soát hơn, dễ bảo trì hơn.

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int _value = 0;
  final MyObject _myObject = MyObject(value_1: 0, value_2: 0);
  String? title;
  Widget _value_1() {
    return Text(
      'Giá trị: ${_myObject.value_1}  ',
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget _value_2() {
    return Text(
      'Giá trị: ${_myObject.value_2}  ',
      style: const TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: Text(title ?? 'Debugging App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const TextField(),r
                  _value_1(),
                  _value_2(),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _myObject.increase();
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _myObject.decrease();
                      });
                    },
                    child: const Icon(Icons.remove),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _myObject.myValue = 100;
                      });
                    },
                    child: const Icon(Icons.numbers),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
