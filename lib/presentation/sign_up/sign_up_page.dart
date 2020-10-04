import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/presentation/sign_up/sign_up_model.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailEditingController = TextEditingController();
    final passwordEditingController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('サインアップ'),
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                TextField(
                  controller: mailEditingController,
                  decoration: InputDecoration(hintText: 'example@gmail.com'),
                  onChanged: (text) {
                    model.mail = text;
                  },
                ),
                TextField(
                  controller: passwordEditingController,
                  decoration: InputDecoration(hintText: 'パスワード'),
                  obscureText: true,
                  onChanged: (text) {
                    model.password = text;
                  },
                ),
                RaisedButton(
                  child: Text('登録する'),
                  onPressed: () async {
                    try {
                      await model.signUp();
                      _showDialog(context, '登録完了しました');
                    } catch(e) {
                      _showDialog(context, e.toString());
                    }
                  },
                ),
              ],
              ),
            );
          },
        ),

      ),
    );
  }
  Future _showDialog(BuildContext context, String title,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}