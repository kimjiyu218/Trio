import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:trio/screen/join_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 100,bottom: 30),
              child: Text(
                '로그인',
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '아이디',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                  onPressed: ()  {
                  },
                style: ButtonStyle(
                  backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF009C89)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 100, vertical: 10)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
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
                      style: TextStyle(color: Colors.white,
                      fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JoinPage())
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(160, 8, 0, 10),
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



