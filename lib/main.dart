import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trio/insert.dart';
import 'package:trio/update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void test() async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://192.168.0.177:9090",
        contentType: "application/json",
      ),
    );
    final res = await dio.get("/board/test");

    if(res.statusCode == 200) {
      print(res.data);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Insert(),
                  )
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text("추가",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Update(),
                  )
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                  child: Center(
                    child: Text("수정",
                    style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
