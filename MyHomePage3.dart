
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescueapp/CameraAcess.dart';



import 'model-patient/patient.dart';

class MyHomePage3 extends StatefulWidget {
  MyHomePage3({this.patient, this.patientIndex, Key key, this.title}) : super(key: key);
  final String title;
  final Patient patient;
  final int patientIndex;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage3> {
  bool _isAmbilatory;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KatApp2'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:40,vertical: 10),
          child: Column(

            children: <Widget>[
          SizedBox(
            height: 40,
            child: Container(

              decoration: BoxDecoration(
                  color: Colors.grey[500]
              ),
              alignment: Alignment.center,
              child:Text('Ist der Patient gehfähig?' ,  style: TextStyle(fontSize: 22, color: Colors.blue[900])),
            )
          ),

              SizedBox(
                height: 40,

                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[500]
                ),

                  alignment: Alignment.center,
                  child:Text('Nein', style: TextStyle(fontSize: 20, color: Colors.blue [900], backgroundColor: Colors.grey[500])),
                )),
              SizedBox(
                  height: 40,

                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[500]
                    ),

                    alignment: Alignment.center,
                    child:Text('A:Spontanatmung vorhanden?', style: TextStyle(fontSize: 20, color: Colors.blue [900], backgroundColor: Colors.grey[500])),
                  )),
              SizedBox(
                  height: 40,

                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[500]
                    ),

                    alignment: Alignment.center,
                    child:Text('Nein', style: TextStyle(fontSize: 20, color: Colors.blue [900], backgroundColor: Colors.grey[500])),
                  )),
              SizedBox(
                height: 100,),

              SizedBox(
                height: 50,


                 child: Container(

                  alignment: Alignment.center,

                   decoration: BoxDecoration(
                       border: Border(
                         left: BorderSide(color: Colors.red, width: 2),
                         right: BorderSide(color: Colors.red, width: 2),
                         top: BorderSide(color: Colors.red, width: 2),

                   ),),
                  child:Text('Kategorie A', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.blue[900], backgroundColor: Colors.white)),
                 )),

              SizedBox(
                  height: 50,
                  width: 500,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.red, width: 2),
                        right: BorderSide(color: Colors.red, width: 2),
                        bottom: BorderSide(color: Colors.red, width: 2),

                      ),),
                    child:Text('Nach Öffnung der Atemwege?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.blue[900], backgroundColor: Colors.white)),
                  )),
          SizedBox(
            height: 100,
          ),
              SizedBox(

              child: Container(
                  width: double.infinity,
                alignment: Alignment.center,
                child:RaisedButton(child: new Text('Ja'), color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        _isAmbilatory = true;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CameraAccess()),
                        );
                  });
                    }))),
              SizedBox(
                child: Container(
                  alignment: Alignment.center,
                  child:RaisedButton(child: new Text('Nein'), color: Colors.blue,
                     onPressed: () {
                        setState(() {
                          _isAmbilatory = false;

                        });
                      }))),
              SizedBox(
                width: 200,
                child: Container(
                  alignment: Alignment.center,
                  child:ElevatedButton(child: new Text('Zurück'), onPressed: () {
                  Navigator.pop(context);
                }))),
    ],
  ),
  ),
  );
}
}



