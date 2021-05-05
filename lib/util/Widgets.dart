import 'package:flutter/material.dart';
import 'package:halyk_fund/screens/FormCreatePage.dart';
import 'package:halyk_fund/util/constants.dart';
import 'package:image_picker/image_picker.dart';

showSelectLangModal(BuildContext context) {
  String language;

  List iconList = [
    'assets/images/ru.png',
    'assets/images/kz.png',
  ];
  List langList = [
    'руский',
    'казакша',
  ];
  int secondaryIndex = 0;

  Widget customRadio2(String link, String lang, int index, setState) {
    return Container(
      margin: EdgeInsets.all(10),
      child: OutlineButton(
        onPressed: () {
          print(lang);
          setState(() {
            secondaryIndex = index;
            if (index == 0) {
              language = "langkz";
            } else if(index == 1){
              language = "langru";
            }
          });
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        borderSide: BorderSide(
            color: secondaryIndex == index
                ? CustomColors.yellow
                : CustomColors.line),
        child: Column(
          children: [
            Container(
              height: 28,
              width: 28,
              child: Image(
                image: AssetImage(link),
              ),
            ),
            Text(
              lang,
              style: TextStyle(fontSize: 9),
            )
          ],
        ),
      ),
    );
  }

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            maxChildSize: 0.35,
            initialChildSize: 0.35,
            minChildSize: 0.10,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 10.0)
                    ]),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                        StatefulBuilder(
                            builder: (BuildContext context, setState) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Выберите язык анкеты",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 24)),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              children: <Widget>[
                                customRadio2(
                                    iconList[0], langList[0], 0, setState),
                                customRadio2(
                                    iconList[1], langList[1], 1, setState),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 40.0,
                              width: 300,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              CustomColors.green)),
                                  onPressed: () {
                                    print(language);
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (BuildContext context) => FormCreatePage(),
                                        ));
                                  },
                                  child: Text("Выбрать")),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
              );
            });
      }
      );
}


