import 'package:flutter/material.dart';
import 'package:mudahjev3/Utils/constant.dart';
import 'package:mudahjev3/Widgets/MainButton.dart';
import 'HomeScreen.dart';
class LoginScreen extends StatelessWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f1f1),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://marketplace.canva.com/EAFaFUz4aKo/2/0/1600w/canva-yellow-abstract-cooking-fire-free-logo-JmYWTjUsE-Q.jpg'),
                    height: 200,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  MainButton(
                      buttonColor: Color(0xFFC90000),
                      onPress: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
                      },
                      text: 'Login')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
