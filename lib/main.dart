import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/book_list_page.dart';
import 'package:testapp/main_model.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Demo for BEERS'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      model.mainCopy,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    RaisedButton(
                      child: Text('TODO'),
                      onPressed: () {
                        // TODO
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookListPage()),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}