import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/models/my_object.dart';
import 'package:flutter_application_1/widgets/value_display_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MyObject _myObject = MyObject(value: 0);
  String? title;

  Widget _buildValueDisplay() {
    return valueDisplay(_myObject.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_drop_down_circle_outlined),
          title: const Text("My App"),
          backgroundColor: Colors.blue,
          actions: const [Icon(Icons.notifications), Icon(Icons.settings)],
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomeButton(
                  onPressed: () {
                    setState(() {
                      _myObject.increase();
                    });
                  },
                  icon: const Icon(Icons.add)),
              _buildValueDisplay(),
              CustomeButton(
                  onPressed: () {
                    setState(() {
                      _myObject.decrease();
                    });
                  },
                  icon: const Icon(Icons.remove)),
            ],
          ),
        ));
  }
}
