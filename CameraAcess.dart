
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc_patient/patient_bloc.dart';
import 'database/database_provide.dart';
import 'events-patient/add_patient.dart';
import 'model-patient/patient.dart';

class CameraAccess extends StatefulWidget {
  Patient patient;
  int patientIndex;
  @override
  State<StatefulWidget> createState() {
    return new CameraAccessState();
  }
}
class CameraAccessState extends State<CameraAccess> {
  Uint8List bytesImage;
  File image;
  String base64Image;
  String _name;
  String _birthday;
  String _imagePath;
  bool _isAmbilatory = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (widget.patient != null) {
      _name = widget.patient.name;
      _birthday = widget.patient.birthday;
      _isAmbilatory = widget.patient.isAmbilatory;
      _imagePath = widget.patient.imagePath;
    }
  }
  @override
  Widget build(BuildContext context) {


      Future getImage() async {
          var image2 = await ImagePicker.pickImage(
            source: ImageSource.camera,
          );
          List<int> imageBytes = image2.readAsBytesSync();
          print(imageBytes);
          _imagePath = base64Encode(imageBytes);
          print('string is');
          print(_imagePath);
          print("You selected gallery image : " + image2.path);

          bytesImage = Base64Decoder().convert(_imagePath);

          setState(() {
            image=image2;
          });
      }
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Camera Access"),
          backgroundColor: Colors.blue,
          actions: <Widget>[
          ],
        ),
        body: new Builder(
          builder: (BuildContext context) {
            return Center(
              child: Form(
                key: _formKey,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 40,
                        child: Container(

                          alignment: Alignment.center,
                          child: Text('Please take a photo of patient.',
                              style: TextStyle(
                                  fontSize: 22, color: Colors.blue[900])),
                        )
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    new RaisedButton(
                        child: new Text('Select Image from Camera'),
                        onPressed: getImage
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 200.0,
                      width: 300.0,
                      child: image == null
                          ? Center(child: new Text('Sorry nothing selected!!'))
                          : Center(child: new Image.file(image)),),
                    RaisedButton(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        Patient patient = Patient(
                          name: _name,
                          birthday: _birthday,
                          isAmbilatory: _isAmbilatory,
                          imagePath: _imagePath,

                        );
                        DatabaseProvider.db.insert(patient).then(
                              (storedPatient) =>
                              BlocProvider.of<PatientBloc>(context).add(
                                AddPatient(storedPatient),
                              ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
