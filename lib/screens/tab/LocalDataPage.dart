import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:halyk_fund/api.dart';
import 'package:halyk_fund/model/Formm.dart';
import 'package:halyk_fund/util/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:random_string/random_string.dart';

class LocalDataPage extends StatefulWidget {
  @override
  _LocalDataPageState createState() => _LocalDataPageState();
}

class _LocalDataPageState extends State<LocalDataPage> {
  File selectedImage;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FormService().getLocal(),
      builder: (BuildContext context, AsyncSnapshot<List<Formm>> snapshot) {
        if (snapshot.hasError || !snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: snapshot.data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            Formm form = snapshot.data[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: CustomColors.line,width: 0.2)
              ),
              child: ListTile(
                title: Text(
                  "№" + form.fid,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: CustomColors.textTitle,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "апрель * 24",
                  style: TextStyle(
                      color: CustomColors.textDesc,
                      fontWeight: FontWeight.w400),
                ),
                leading: form.fImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          form.fImage,
                          width: 57,
                          height: 57,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset("assets/images/image.png",
                        width: 57, height: 57, fit: BoxFit.cover),
                trailing: Container(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColors.green)),
                      onPressed: () {
                        if(form.fImage!=null) {
                          Map<String, String> formMap = {"gg": "saved"};
                          Firestore.instance
                              .collection("form")
                              .document(form.fid)
                              .updateData(formMap)
                              .catchError((e) {
                            print(e);
                          });
                          showAlertDialog(context);
                          Timer _timer;
                          int _start = 2;

                          void startTimer() {
                            const oneSec = const Duration(seconds: 1);
                            _timer = new Timer.periodic(
                              oneSec,
                                  (Timer timer) {
                                if (_start >= 0) {
                                  setState(() {
                                    timer.cancel();
                                    Navigator.pop(context);
                                  });
                                } else {
                                  setState(() {
                                    --_start;
                                    print(--_start);
                                  });
                                }
                              },
                            );
                          }
                          startTimer();
                        }else{
                          showQuesFormModal(context,form.fid);
                        }
                      },
                      child: Text(form.fImage!=null?"Сдать анкету":"Фото-отчет")),
                ),
              ),
            );
          },
        );
      },
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40))
        ),
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Lottie.asset("assets/images/done.json",
            width: 190, height: 190, fit: BoxFit.fill),
      ),
      content: Container(alignment: Alignment.topCenter,height:20,child: Text("Вы успешно отправили анкету!")),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showQuesFormModal(BuildContext context, String fid) {
    bool progress = false;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              maxChildSize: 0.70,
              initialChildSize: 0.50,
              minChildSize: 0.30,
              expand: false,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 10.0)
                      ]),
                  child: SingleChildScrollView(
                      controller: scrollController,
                      child: StatefulBuilder(
                          builder: (BuildContext context, setState) {
                        Future getImage() async {
                          var image = await ImagePicker.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            selectedImage = image;
                          });
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 6,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text("Фото-отчет",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 24)),
                            SizedBox(
                              height: 25.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  getImage();
                                },
                                child: selectedImage != null
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              height: 170,
                                              width: 260,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Image.file(
                                                  selectedImage,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // decoration: BoxDecoration(
                                              //   borderRadius: BorderRadius.circular(6),
                                              // ),
                                              child: Icon(
                                                Icons.refresh,
                                                color: Colors.white,
                                              ),
                                            )
                                          ])
                                    : Container(
                                        height: 170,
                                        width: 260,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border.all(width: 0.1)),
                                        child: Icon(
                                          Icons.add_a_photo,
                                          color: Colors.black45,
                                        ),
                                      )),
                            SizedBox(
                              height: 25.0,
                            ),
                            Container(
                              height: 40.0,
                              width: 300,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              CustomColors.green)),
                                  onPressed: () async {
                                    setState(() {
                                      progress = true;
                                    });
                                    StorageReference firebaseStorageRef =
                                        FirebaseStorage.instance
                                            .ref()
                                            .child("FormImages")
                                            .child(
                                                "${randomAlphaNumeric(9)}.jpg");
                                    final StorageUploadTask task =
                                        firebaseStorageRef
                                            .putFile(selectedImage);
                                    var downloadUrl =
                                        await (await task.onComplete)
                                            .ref
                                            .getDownloadURL();

                                    Map<String, String> formMap = {
                                      "fImage": downloadUrl
                                    };
                                    Firestore.instance
                                        .collection("form")
                                        .document(fid)
                                        .updateData(formMap)
                                        .then((value) {
                                      setState(() {
                                        progress = false;
                                      });
                                      Navigator.pop(context);
                                    }).catchError((e) {
                                      print(e);
                                    });
                                  },
                                  child: progress
                                      ? SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          ))
                                      : Text("Сохранить")),
                            ),
                          ],
                        );
                      })),
                );
              });
        });
  }
}
