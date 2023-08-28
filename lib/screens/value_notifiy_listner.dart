import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("Build notifier");
    return Scaffold(
        appBar: AppBar(
          title: const Text("NotifyListner"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: obscureText,
                builder: (context, value, child) {
                  return TextField(
                    obscureText: obscureText.value,
                    decoration: InputDecoration(
                      hintText: "password",
                      suffix: InkWell(
                        onTap: () {
                          obscureText.value = !obscureText.value;
                        },
                        child: Icon(obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  );
                }),
            ValueListenableBuilder(
                valueListenable: counter,
                builder: (context, value, child) {
                  return Center(
                    child: Text(
                      counter.value.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.value++;
            print(counter.value);
          },
          child: const Icon(Icons.add),
        ));
  }
}
