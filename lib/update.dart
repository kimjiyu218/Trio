import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _inquiryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _inquiryController.dispose();
    super.dispose();
  }

  void _updateInquiry() {
    // 여기에 문의 내용을 수정하는 로직을 구현합니다.
    String name = _nameController.text;
    String email = _emailController.text;
    String inquiry = _inquiryController.text;

    // 수정된 내용을 어딘가에 저장하거나 서버로 전송하는 등의 작업을 수행합니다.

    // 예시로 수정이 완료되었다는 메시지를 보여줍니다.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('문의 내용이 수정되었습니다.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('고객센터'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '수정하기',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: '이름',
                hintText: '이름을 입력하세요',
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: '이메일',
                hintText: '이메일을 입력하세요',
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _inquiryController,
              decoration: InputDecoration(
                labelText: '문의 내용',
                hintText: '문의할 내용을 입력하세요',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 10.0),
            Text(
              '이미지 첨부',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  size: 50.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _updateInquiry, // 수정 버튼에 함수 연결
              child: Text('수정하기'),
            ),
          ],
        ),
      ),
    );
  }
}
