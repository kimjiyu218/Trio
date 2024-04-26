import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trio/data_class.dart';

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
  List<dynamic> list = [];

  @override
  void initState() {
    super.initState();
    test();
  }

  void test() async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.0.177:9090",
        contentType: "application/json",
      ),
    );
    final res = await dio.get("/board/test");

    if (res.statusCode == 200) {
      print(res.data);
      list = res.data;
    }
  }

  void main(List<String> arguments) {
    const aPerson = Person(
        bno: 123,
        title: "title",
        content: "content",
        writer: "writer",
        regdate: "regdate",
        viewcnt: "viewcnt");
    print(aPerson);
    const bPerson = Person(
        bno: 123,
        title: "title",
        content: "content",
        writer: "writer",
        regdate: "regdate",
        viewcnt: "viewcnt");
    print(aPerson == bPerson);

    final json = {
      "bno": 1,
      "title": "title",
      "content": "content",
    };

    final Person book = Person.fromJson(json);
    book.title;
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
                  ));
                },
                child: Container(
                  width: 50,
                  height: 30,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "추가",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Update(),
                  ));
                },
                child: Container(
                  width: 50,
                  height: 30,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      "수정",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 800,
                width: 200,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(list[index]["title"]),
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    test();
                  },
                  child: Text("button"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
