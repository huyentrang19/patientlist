import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyHomePage2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KatApp',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
        home: MyHomePage()
      //home: MyHomePage(title: 'KatApp Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KatApp Startseite'),
      ),

        body: Center(
        child: Column(
            children: <Widget>[
              SizedBox(
                height: 250,
              ),
              SizedBox(
              child: Container (
                child: RaisedButton(
               child: Text('ÜBUNG', style: TextStyle(fontSize: 22, color: Colors.white,)),
                  color: Colors.green,
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage2()),
                            );
                          },
                        ))
        ),
          SizedBox (
            height: 20,
          ),
         SizedBox (
            child: Container (
              child: RaisedButton(
                 child: Text('REAL',style: TextStyle(fontSize: 22, color: Colors.white)),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    );}
              ) ),),
            ],
        ),
      ),
    );
  }
}
