import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo GetX'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required String title});
  final CounterController _c = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('GetX Application')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Obx(() => Text(
                      '${_c._data}',
                      style: const TextStyle(fontSize: 20.0),
                    )),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      _c.deCrement();
                    },
                    child: const Text('-'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      _c.inCrement();
                    },
                    child: const Text('+'),
                  )
                ],
              )
            ]));
  }
}

class CounterController extends GetxController {
  var _data = 0.obs;
  inCrement() => _data++;
  deCrement() => _data--;
}
