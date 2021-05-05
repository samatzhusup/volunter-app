import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:halyk_fund/api.dart';
import 'package:halyk_fund/model/Formm.dart';
import 'package:halyk_fund/util/constants.dart';

class SavedDataPage extends StatefulWidget {
  @override
  _SavedDataPageState createState() => _SavedDataPageState();
}

class _SavedDataPageState extends State<SavedDataPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FormService().getSaved(),
      builder: (BuildContext context, AsyncSnapshot<List<Formm>> snapshot) {
        if (snapshot.hasError || !snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: snapshot.data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            Formm form = snapshot.data[index];
            return Container(
              child: ListTile(
                title: Text(
                 "№"+form.fid,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: CustomColors.textTitle, fontWeight: FontWeight.w600),
                ),
                subtitle: Text("апрель * 24",style: TextStyle(
                    color: CustomColors.textDesc, fontWeight: FontWeight.w400),),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    form.fImage,
                    width: 57,
                    height: 57,
                    fit: BoxFit.cover,
                  ),
                )
              ),
            );
          },
        );
      },
    );
  }
}
