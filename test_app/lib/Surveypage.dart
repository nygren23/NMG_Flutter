import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Surveypage extends StatefulWidget {
  @override
  SurveypageState createState() => SurveypageState();
}

class SurveypageState extends State<Surveypage> {
  final _key = GlobalKey<FormState>();
  final database = Firestore.instance;
  String fullName = '';
  String testValue = '0zero';
  String gender = '';
  String state = '';
  String major = '';
  String university = '';
  String feedback = '';
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('COVID Survey'),
            ),
            body: Form(
              key: _key,
              child: Scrollbar(
                controller: scrollController,
                isAlwaysShown: true,
                child: ListView(controller: scrollController,
                    children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              top: 10.0,
                            ),
                            child: Align(
                              child: Text(
                                'First and Last Name:',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              height: 20,
                              width: 30,
                              child: Image(
                                image: AssetImage(
                                  "assets/icon.png",
                                ),
                              ),
                            ),
                          ),
                        ]),
                        CustomTextFormField(
                          hintText: 'Enter your First and Last Name',
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Enter your First and Last Name';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            fullName = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 10.0,
                          ),
                          child: Align(
                            child: Text(
                              'University:',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        CustomTextFormField(
                          hintText: 'Enter your University',
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Enter a University';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            university = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 10.0,
                          ),
                          child: Align(
                            child: Text('Major:'),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        CustomTextFormField(
                          hintText: 'Enter your Major',
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Enter a Major';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            major = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: Align(
                            child: Text('Gender:'),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Row(children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Checkbox(
                                value: checkboxValue1,
                                onChanged: (bool value) {
                                  setState(() {
                                    if (checkboxValue1 == false) {
                                      checkboxValue1 = true;
                                      checkboxValue2 = false;
                                      checkboxValue3 = false;
                                    } else {
                                      checkboxValue1 = false;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          Text('Male')
                        ]),
                        Row(children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Checkbox(
                                value: checkboxValue2,
                                onChanged: (bool value) {
                                  setState(() {
                                    if (checkboxValue2 == false) {
                                      checkboxValue1 = false;
                                      checkboxValue2 = true;
                                      checkboxValue3 = false;
                                    } else {
                                      checkboxValue2 = false;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          Text('Female')
                        ]),
                        Row(children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Checkbox(
                                value: checkboxValue3,
                                onChanged: (bool value) {
                                  setState(() {
                                    if (checkboxValue3 == false) {
                                      checkboxValue1 = false;
                                      checkboxValue2 = false;
                                      checkboxValue3 = true;
                                    } else {
                                      checkboxValue3 = false;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          Text('Other/Prefer not to Say')
                        ]),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Align(
                            child: Text('State:'),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: DropdownButton(
                                  autofocus: false,
                                  isExpanded: true,
                                  value: state,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(
                                        'State',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                      value: '',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Washington'),
                                      value: 'Washington',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Idaho'),
                                      value: 'Idaho',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Oregon'),
                                      value: 'Oregon',
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      state = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Feedback on Survey (optional)'),
                                ),
                                TextFormField(
                                  onSaved: (String value) {
                                    feedback = value;
                                  },
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        Container(
                          child: RaisedButton(
                            child: Text('Submit'),
                            onPressed: () async {
                              if (checkboxValue1) {
                                gender = 'male';
                              }
                              if (checkboxValue2) {
                                gender = 'female';
                              }
                              if (checkboxValue3) {
                                gender = 'other';
                              }

                              if (_key.currentState.validate() &&
                                  fullName == '') {
                                _key.currentState.save();
                                await database.collection('COVID Survey (S)').add({
                                  'Full Name': fullName,
                                  'University': university,
                                  'Major': major,
                                  'Gender': gender,
                                  'State': state,
                                  'Feedback': feedback,
                                });

                                Navigator.pop(context, false);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            )));
  }
}

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  CustomTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(10.0),
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
