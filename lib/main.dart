import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyObject {
  int value;

  MyObject(this.value);
  // Tang gia tri len 1 don vi
  void increase() {
    value++;
  }

  // Giam gia tri xuong 1 don vi
  void decrease() {
    value--;
  }

  int get myValue => value;
  set myValue(int newValue) {
    value = newValue;
  }
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
  MyObject _myObject = MyObject(0);
  String? title;
  Widget _buildText() {
    return Text(
      'Giá trị: ${_myObject.value}  ',
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
              _buildText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
