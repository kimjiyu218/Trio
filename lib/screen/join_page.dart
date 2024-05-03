import 'package:flutter/material.dart';

//Text값을 사용자에게 받아와야 하기 때문에 Stataless 위젯이 아닌 Stateful 위젯으로 동적 화면을 만든다.
class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  TextStyle style = TextStyle(
      // Montserrat 스타일로 사이즈는 20.0을 준다.
      fontFamily: 'Montserrat',
      fontSize: 20.0);

  //텍스트 입력값을 가져오는 Controller 단 입니다.
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password2 = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _id = TextEditingController();

  //GlobalKey는 전체 앱에서 위젯을 고유하게 식별하는 데 사용됩니다. 동일한 상태의 동일 위젯으로 구성된 컬렉션을 재정렬하거나 추가/삭제하는 등의 작업을 한다면 필요하다.
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: "");
    _id = TextEditingController(text: "");
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
    _password2 = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _name.dispose();
    _id.dispose();
    _email.dispose();
    _password.dispose();
    _password2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("계정 만들기 "),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _name,
                  validator: (value) => (value!.isEmpty) ? "이름을 입력해 주세요" : null,
                  style: style,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Name",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _id,
                  validator: (value) =>
                      (value!.isEmpty) ? "아이디를 입력해 주세요 " : null,
                  style: style,
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
                  controller: _password,
                  validator: (value) =>
                      (value!.isEmpty) ? "패스워드를 입력 해 주세요 " : null,
                  style: style,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _email,
                  validator: (value) =>
                      (value!.isEmpty) ? "이메일을 입력해 주세요" : null,
                  style: style,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.red,
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "계정 만들기",
                      style: style.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
