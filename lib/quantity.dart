import 'package:counter_application/provider/my_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class QuantityPage extends StatefulWidget {
  const QuantityPage({Key? key}) : super(key: key);

  @override
  State<QuantityPage> createState() => _QuantityPageState();
}

class _QuantityPageState extends State<QuantityPage> {
  int count = 1;
  int min = 1;
  int max = 10;

  // void initState() {
  //   _buttondisable = false;

  // }

  void increment() {
    if (count < max) {
      setState(() {
        count++;
      });
    }
  }

  void decrement() {
    if (count > min) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<MyProvider>(context, listen: false);
    print("print1");
    return Scaffold(
      body: Center(
          child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(color: Color.fromARGB(255, 172, 183, 192)),
        child: Consumer<MyProvider>(
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Quantity",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: FloatingActionButton(
                      backgroundColor: value.count == value.min
                          ? Color.fromARGB(255, 193, 197, 203)
                          : Colors.white,
                      child: Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        counter.decrement();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 231, 240, 243)),
                      child: Center(child: Text("${value.count}"))),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: FloatingActionButton(
                      backgroundColor: value.count == value.max
                          ? Color.fromARGB(255, 193, 197, 203)
                          : Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        counter.increment();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
