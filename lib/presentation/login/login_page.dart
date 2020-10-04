import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/presentation/login/login_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailEditingController = TextEditingController();
    final passwordEditingController = TextEditingController();

    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ログイン'),
        ),
        body: Consumer<LoginModel>(
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
                  child: Text('ログインする'),
                  onPressed: () async {
                    try {
                      await model.login();
                      _showDialog(context, 'ログインしました');
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