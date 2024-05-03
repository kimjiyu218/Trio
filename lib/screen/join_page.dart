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
  TextEditingController _pw = TextEditingController();
  TextEditingController _pw2 = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _id = TextEditingController();

  @override
  //initState 는 Flutter 위젯의 상태가 초기화될 때 호출되는 메소드입니다. 이 메소드는 StatefulWidget 클래스에서 오버라이드 하여 상태 초기화 로직을 구현할 수 있습니다.
  void initState() {
    //super.initState 코드는 현재 클래스에서 오버라이드 된 initState() 메서드 내에서 상위 클래스의 initState() 메서드를 호출하는 것을 의미합니다.
    super.initState();
    _name = TextEditingController(text: "");
    _id = TextEditingController(text: "");
    _email = TextEditingController(text: "");
    _pw = TextEditingController(text: "");
    _pw2 = TextEditingController(text: "");
  }

  @override
//여기서 dispose을 사용해서 메모리 누수를 방지한다. 한마디로 수도꼭지로 물을 틀었으면 다시 잠가준다고 생각하면 된다.
  void dispose() {
    _name.dispose();
    _id.dispose();
    _email.dispose();
    _pw.dispose();
    _pw2.dispose();
    //super.dispose를 호출하여 부모 클래스의 dispose 메소드를 실행하여 추가적인 정리 작업을 수행할 수 있습니다.
    super.dispose();
  }

  bool isValidEmail(String email) {
    // 이메일 주소의 정규식
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void check() {
    String email = "example@example.com"; // 여기에 확인할 이메일 주소를 넣으세요
    if (isValidEmail(email)) {
      print("$email은(는) 유효한 이메일 주소입니다.");
    } else {
      print("$email은(는) 유효하지 않은 이메일 주소입니다.");
    }
  }

  void join() {
    String joinId = _id.text;
    String joinPw = _pw.text;
    String joinName = _name.text;
    String joinEmail = _email.text;

    if (joinId.length >= 13) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: Text(" ID는 12자리이하 까지만 가능합니다. "),
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
      return;
    }
    if (joinPw.length >= 13) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: Text(" 패스워드는 12자리이하 까지만 가능합니다. "),
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
      return;
    }
    if (joinName.length >= 8) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: Text(" 이름은 7자리이하 까지만 가능합니다. "),
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
      return;
    }

    if(!isValidEmail(joinEmail)){
      showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx){
        return AlertDialog(
          content: Text("유효하지 않은 이메일 주소입니다."),
          actions: [
            InkWell(
              onTap: (){Navigator.of(context).pop();
                },
              child: Text('확인'),
            )
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("계정 만들기 "),
      ),
      body: Form(
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
                  controller: _pw,
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
                      join();
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
