import 'package:flutter/material.dart';
import 'package:halyk_fund/model/Formm.dart';
import 'package:halyk_fund/util/constants.dart';

import '../api.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(elevation: 0,title: Text("Уведомление"),),
        body: StreamBuilder(
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
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide( //                   <--- left side
                        color: CustomColors.line,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: ListTile(
                      title: Text(
                        "Загрузка успешно завершена",
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: CustomColors.textTitle, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text("№"+form.fid+" был сохранен успешно!",style: TextStyle(
                          color: CustomColors.textDesc, fontWeight: FontWeight.w400),),
                      leading:  Image.asset(
                        "assets/images/upload.png",
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    trailing: Column(
                      children: [
                        Text("23:00",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        )
      );
  }
}
