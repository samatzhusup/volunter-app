import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

import '../api.dart';

class FormCreatePage extends StatefulWidget {
  @override
  _FormCreatePageState createState() => _FormCreatePageState();
}

class _FormCreatePageState extends State<FormCreatePage> {
  int _currentStep = 0;
  int houseseletctRadio = 0;
  int lifeRadio = 0;
  TextEditingController fullnameController,
      phoneController,
      adressController,
      yearoldController,
      childnum4Controller,
      exquesController;

  @override
  void initState() {
    super.initState();
    fullnameController = TextEditingController(text: '');
    phoneController = TextEditingController(text: '');
    adressController = TextEditingController(text: '');
    yearoldController = TextEditingController(text: '');
    childnum4Controller = TextEditingController(text: '');
    exquesController = TextEditingController(text: '');

    houseseletctRadio = 0;
    lifeRadio = 0;
  }

  next() {
    _currentStep < 7 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  goTo(int step) {
    setState(() => _currentStep = step);
  }

  setSelectedRadio(int val) {
    setState(() {
      houseseletctRadio = val;
    });
  }

  setSecSelectedRadio(int val) {
    setState(() {
      lifeRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
          isActive: _currentStep == 0,
          title: const Text("Основная информация"),
          content: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(labelText: 'ФИО респондента'),
                  controller: fullnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите текст';
                    }
                  }),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: 'Номер моб. телефона респондента'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите текст';
                  }
                },
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                  controller: adressController,
                  decoration:
                  InputDecoration(labelText: 'Полный адрес респондента'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите текст';
                    }
                  }),
              TextFormField(
                  controller: yearoldController,
                  decoration: InputDecoration(labelText: 'Возраст респондента'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите текст';
                    }
                  },
                  keyboardType: TextInputType.number),
            ],
          )),
      Step(
          isActive: _currentStep == 1,
          title: const Text('Семейное положение респондента'),
          content: Column(
            children: <Widget>[
              RadioListTile(
                value: 1,
                groupValue: lifeRadio,
                title: Text("замужем/ женат"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSecSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: lifeRadio,
                title: Text("не замужем/ не женат"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSecSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 3,
                groupValue: lifeRadio,
                title: Text("разведена/ разведен"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSecSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 4,
                groupValue: lifeRadio,
                title: Text("вдова/ вдовец"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSecSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 5,
                groupValue: lifeRadio,
                title: Text("состою в незарегистрированном браке"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSecSelectedRadio(val);
                },
              ),
            ],
          )),
      Step(
          isActive: _currentStep == 2,
          title: const Text('О семье'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                  controller: childnum4Controller,
                  decoration: InputDecoration(
                      labelText:
                      'Количество несовершеннолетних детей в семье респондента'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите текст';
                    }
                  },
                  keyboardType: TextInputType.number),
              TextFormField(
                  controller: exquesController,
                  decoration: InputDecoration(
                      labelText:
                      'Есть ли у вас на содержании еще кто-то кроме ребенка/детей?'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите текст';
                    }
                  }),
            ],
          )),
      Step(
          isActive: _currentStep == 3,
          title: const Text('Ваши жилищные условия?'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RadioListTile(
                value: 1,
                groupValue: houseseletctRadio,
                title: Text("квартира"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: houseseletctRadio,
                title: Text("жилой дом "),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 3,
                groupValue: houseseletctRadio,
                title: Text("комната "),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 4,
                groupValue: houseseletctRadio,
                title: Text("съемное жилье"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadio(val);
                },
              ),
              RadioListTile(
                value: 5,
                groupValue: houseseletctRadio,
                title: Text("живем у родственников "),
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadio(val);
                },
              ),
            ],
          )),
    ];

    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Создать анкету'),
      ),
      body: Theme(
        data: ThemeData(
            primarySwatch: Colors.green,
            colorScheme: ColorScheme.light(
                primary: Colors.green
            )
        ),
        child: Stepper(
          steps: steps,
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepTapped: (step) => goTo(step),
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            if (_currentStep == 0) {
              return Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        next();
                      },
                      child: Text("Следующие"),
                    ),
                  ),
                ],
              );
            } else if (_currentStep == steps.length - 1) {
              return Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        String houseseletctRadiotext;
                        String lifeRadiotext;

                        switch (houseseletctRadio) {
                          case 1:
                            houseseletctRadiotext = "квартира";
                            break;
                          case 2:
                            houseseletctRadiotext = "жилой дом";
                            break;
                          case 3:
                            houseseletctRadiotext = "комната";
                            break;
                          case 4:
                            houseseletctRadiotext = "съемное жилье ";
                            break;
                          case 5:
                            houseseletctRadiotext = "живем у родственников";
                            break;
                        }
                        switch (lifeRadio) {
                          case 1:
                            lifeRadiotext = "замужем/женат";
                            break;
                          case 2:
                            lifeRadiotext = "не замужем/не женат";
                            break;
                          case 3:
                            lifeRadiotext = "разведена/разведен";
                            break;
                          case 4:
                            lifeRadiotext = "вдова/вдовец";
                            break;
                          case 5:
                            lifeRadiotext =
                            "состою в незарегистрированном браке";
                            break;
                        }
                        print(fullnameController.text);
                        print(phoneController.text);
                        print(adressController.text);
                        print(yearoldController.text);
                        print(lifeRadiotext);
                        print(childnum4Controller.text);
                        print(exquesController.text);
                        print(houseseletctRadiotext);

                        String fid = randomAlphaNumeric(16);

                        DateTime now = DateTime.now();
                        String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss')
                            .format(now);
                        FirebaseUser user = await FirebaseAuth.instance
                            .currentUser();

                        Map<String, dynamic> form = {
                          "fid": fid,
                          "fullname": fullnameController.text,
                          "phone": phoneController.text,
                          "address": adressController.text,
                          "yearold": yearoldController.text,
                          "lifestatus": lifeRadiotext,
                          "aboutchild": childnum4Controller.text,
                          "extraques": exquesController.text,
                          "house": houseseletctRadiotext,
                          "gg": "local",
                          "created ": formattedDate,
                          "updated ": formattedDate,
                          "vid ": user.uid,
                        };
                        Firestore.instance.collection("form").document(fid)
                            .setData(form).then((value) =>
                            Navigator.pop(context))
                            .catchError((e) {
                          print(e);
                        });
                      },
                      child: Text("Сохранитьв"),
                    ),
                  ),
                ],
              );
            } else if (_currentStep >= 2 && _currentStep <= 3) {
              return Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8, top: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        cancel();
                      },
                      child: Text("Предыдущий"),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.grey)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        next();
                      },
                      child: Text("Следующий"),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8, top: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        cancel();
                      },
                      child: Text("Предыдущий"),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.grey)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        next();
                      },
                      child: Text("Cледующий"),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
