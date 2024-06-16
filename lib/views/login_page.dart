import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsm_inside_flutter/apis/fetch_api.dart';
import 'package:gsm_inside_flutter/models/login_model.dart';
import 'package:gsm_inside_flutter/views/select_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future loginFetchApi(BuildContext context) async {
    var data = LoginModel(
            username: _usernameController.text,
            password: _passwordController.text)
        .toJson();
    if (await FetchApi.loginFetchApi(data)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectPage(),
        ),
      );
    } else {
      _showAlert(
        title: '로그인 실패',
        message: '다시 시도해주세요',
        context: context,
      );
    }
  }

  void _showAlert({
    required String title,
    required String message,
    required BuildContext context,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'username'),
            controller: _usernameController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'password'),
            controller: _passwordController,
          ),
          ElevatedButton(
              onPressed: () => loginFetchApi(context),
              child: const Text('login'))
        ],
      ),
    );
  }
}
