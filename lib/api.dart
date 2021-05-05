
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halyk_fund/model/User.dart';
import 'model/Formm.dart';

class FormService {

  Future<void> createForm(form,String formId) async {
    Firestore.instance.collection("form").document(formId).setData(form).catchError((e) {
      print(e);
    });
  }

  Future<void> updateForm(status,String formId,) async {
    Firestore.instance.collection("form").document(formId).updateData(status).catchError((e) {
      print(e);
    });
  }

  Stream<List<Formm>> getLocal() {
    return  Firestore.instance.collection('form').where("gg",isEqualTo: "local").snapshots().map(
            (snapshot) => snapshot.documents.map(
              (doc) => Formm.fromMap(doc.data, doc.documentID),
        ).toList()
    );
  }

  Stream<List<Formm>> getSaved() {
    return  Firestore.instance.collection('form').where("gg",isEqualTo: "saved").snapshots().map(
            (snapshot) => snapshot.documents.map(
              (doc) => Formm.fromMap(doc.data, doc.documentID),
        ).toList()
    );
  }

  Stream<List<User>> getUser() {
    return  Firestore.instance.collection('users').snapshots().map(
            (snapshot) => snapshot.documents.map(
              (doc) => User.fromMap(doc.data, doc.documentID),
        ).toList()
    );
  }

  Stream<List<Formm>> getProduct(String pId) {
    return  Firestore.instance.collection('product').where("pId",isEqualTo: pId).snapshots().map(
          (snapshot) => snapshot.documents.map(
            (doc) => Formm.fromMap(doc.data, doc.documentID),
      ).toList()
    );
  }

}
