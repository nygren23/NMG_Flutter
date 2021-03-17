import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Upload extends StatefulWidget {
  final String folder;

  Upload(this.folder);

  @override
  _State createState() => _State();
}

class _State extends State<Upload> {
  StorageUploadTask uploadTask;
  File _image;
  bool _progress = false;
  double _uploadOpacity = 1.0;
  int _busy = 0;


  Future chooseFile() async {
    // ignore: deprecated_member_use
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
    _uploadOpacity = 1.0;
  }

  Future uploadImage(BuildContext context, String destFolder) async {
    if(_busy == 0) {
      setState(() {
        _progress = true;
      });
      _busy = 1;
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
      FirebaseStorage.instance.ref().child(destFolder).child(fileName);
      uploadTask = firebaseStorageRef.putFile(_image);

      await uploadTask.onComplete;
      setState(() {
        print("Picture Uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Picture Uploaded'),
          duration: Duration(seconds: 1),
        ));
      });
      _image = null;
      _progress = false;
      _busy = 0;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Photos of Your Work',
        ),
      ),
      body: Builder(
        builder: (context) => Container(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                shrinkWrap: false,
                physics: ClampingScrollPhysics(),
                children: <Widget>[

                  SizedBox(
                  height: 30.0,
                  ),

                  RaisedButton(
                    child: Text('Select Image'),
                    onPressed: () {
                      chooseFile();
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: double.infinity,
                  ),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      setState(() {
                        //_progress = true;
                        _uploadOpacity = 0.5;
                      });
                      if (_image != null) {
                        uploadImage(context, widget.folder);
                      }
                    },

                  ),
                  Center(
                    child: _progress
                        ? LinearProgressIndicator(
                            value: null,
                            backgroundColor: Colors.grey,
                            //valueColor: Colors.white,
                          )
                        : Container(),
                  ),
                  _image != null
                      ? Opacity(
                          child: Image.file(
                            _image,
                          ),
                          opacity: _uploadOpacity,
                        )
                      : Container(
                          height: 200.0,
                        ),
                ],
              )),
        ),
      ),
    );
  }
}
