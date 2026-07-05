import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/screens/counter/controller/counter_controller.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});

  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Counter App", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: []),
          Obx(() {
            return Text(
              "${controller.counter.value}",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            );
          }),
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.decrement();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.grey),
                      foregroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    child: Text("-", style: TextStyle(fontSize: 16)),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.increment();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black87),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    child: Text("+"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.reset();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black87),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    child: Text("Reset"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.startTimer();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black87),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    child: Text("Start"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
