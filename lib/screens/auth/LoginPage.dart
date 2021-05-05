import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halyk_fund/util/constants.dart';
import 'package:halyk_fund/util/display_alert.dart';
import '../HomePage.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  static RegExp validEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var isHidden = true;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
            backgroundColor: Colors.white,
            appBar: _appbar(),
            body: MediaQuery.of(context).size.width > 800
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        _body(size)
                      ],
                    ),
                  )
                : _body(size)),
        isLoading ? showProgress(context) : Container()
      ],
    );
  }

  Widget _appbar() {
    return AppBar(
      title: Text(
        "Login",
        style: TextStyle(color: Colors.white),
      ),
      elevation: 0.0,
    );
  }

  Widget _body(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.01),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
                Container(height:178,
                    width: 158
                    ,child: Image.asset("assets/images/logo.png")),
              _emailField(size),
              _passwordTextField(size),
              loginButton(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: "Почта",
          hintStyle: TextStyle(color: Colors.grey),
        ),
        validator: (value) {
          if (value.trim().isEmpty) {
            return "Please Enter Email Address";
          } else if (!validEmail.hasMatch(value.trim())) {
            return "Please Enter Valid Email Address";
          }
          return null;
        },
      ),
    );
  }

  Widget _passwordTextField(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: TextFormField(
        obscureText: isHidden,
        controller: _passController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            hintText: "Пороль",
            hintStyle: TextStyle(color: Colors.grey),
            suffix: GestureDetector(
              child: Icon(
                isHidden ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
            )),
        validator: (value) {
          if (value.isEmpty || value.trim().isEmpty) {
            return "Please Enter password";
          }
          return null;
        },
      ),
    );
  }

  Widget loginButton(Size size) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        child: MaterialButton(
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8)),
            color: CustomColors.green,
            height: 50,
            minWidth: double.infinity,
            child: Text(
              "Войти",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              login(context);
            }),
      );
    });
  }

  Widget _textDetails({String first, String sec, Function route}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          first,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          child: Text(
            sec,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
          onTap: route,
        )
      ],
    );
  }

  login(context) {
    if (_formKey.currentState.validate()) {
      loadProgress();
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passController.text)
          .then((currentUser) => Firestore.instance
                  .collection("users")
                  .document(currentUser.uid)
                  .get()
                  .then((result) {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(uId: currentUser.uid),
                    ));
              }).catchError((err) => print(err)))
          .catchError((err) {
            stopProgress();
          });
    }
  }

  stopProgress() {
    setState(() {
      isLoading = false;
    });
    print("loading");
  }

  loadProgress() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
