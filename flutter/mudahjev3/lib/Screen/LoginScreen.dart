import 'package:flutter/material.dart';
import 'package:mudahjev3/Screen/Registration.dart';
import 'package:mudahjev3/Utils/constant.dart';
import 'package:mudahjev3/Widgets/AuthFooter.dart';
import 'package:mudahjev3/Widgets/AuthTitle.dart';
import 'package:mudahjev3/Widgets/MainButton.dart';
import 'HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f1f1),
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image(
                //   image: NetworkImage(
                //       'https://marketplace.canva.com/EAFaFUz4aKo/2/0/1600w/canva-yellow-abstract-cooking-fire-free-logo-JmYWTjUsE-Q.jpg'),
                //   height: 200,
                // ),
                // SizedBox(
                //   height: 16.0,
                // ),
                AuthTitle(title: 'Login', desc: 'Please login to your account'),

                const SizedBox(
                  height: 8,
                ),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                MainButton(
                  buttonColor: Color(0xFFC90000),
                  onPress: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      final cred = await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homescreen()));
                                        } on FirebaseAuthException catch (e) {
                      print(e);
                      if (e.code == 'user-not-found') {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: 'Sorry, user not found',
                          title: 'Oops...',
                          backgroundColor: Colors.white,
                          titleColor: Colors.black,
                          textColor: Colors.black,
                        );
                      } else if (e.code == 'wrong-password') {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: 'Sorry, wrong password',
                          title: 'Oops...',
                          backgroundColor: Colors.white,
                          titleColor: Colors.black,
                          textColor: Colors.black,
                        );
                      }

                      setState(() {
                        _isLoading = false;
                      });

                      print(e);
                    }
                  },
                  text: 'Login',
                ),

                AuthFooter(text: 'Dont\'t have an account?', navigator: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                },navigatorText: 'Register',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
