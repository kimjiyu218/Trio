
import 'package:flutter/material.dart';

import 'package:trio/screen/join_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _id = TextEditingController();
  TextEditingController _pw = TextEditingController();

  @override
  void initState() {
    super.initState();
    _id = TextEditingController(text: "");
    _pw = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _id.dispose();
    _pw.dispose();
    super.dispose();
  }

  void login() {
    String loginId = _id.text;
    String loginPw = _pw.text;

    if (loginId.length >= 12) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: Text("ID 또는 비밀번호가 맞지 않습니다"),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ],
            );
          });
    }
    if (loginPw.length >= 12) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: Text("비밀번호가 맞지 않습니다"),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 30),
              child: Text(
                '로그인',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _id,
                validator: (value) =>
                (value!.isEmpty) ? "아이디를 입력해 주세요 " : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: "ID",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                obscureText: true,
                controller: _pw,
                validator: (value) =>
                (value!.isEmpty) ? "패스워드를 입력 해 주세요 " : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF001C89)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 140, vertical: 10)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  elevation: MaterialStateProperty.all<double>(3),
                ),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  width: 80,
                  child: Center(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JoinPage()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(200, 8, 0, 0),
                child: Container(
                  alignment: Alignment.centerRight,
                  width: 60,
                  child: Text(
                    '회원가입',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
