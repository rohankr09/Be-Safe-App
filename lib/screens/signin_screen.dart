import 'package:besafe/screens/home_screen.dart';
import 'package:besafe/screens/reset_password.dart';
import 'package:besafe/screens/signup_screen.dart';
import 'package:besafe/screens/utils/colors_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  bool loading = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/logo1.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 5,
                  ),
                  if(loading==true) ... [
                    SpinKitRing(
                      color: Colors.white,
                      size: 50.0,
                    )],
                  forgotPassword(context),
                  firebaseButton(context, "Sign In", () {
                    loading = true;
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                        .then((value) {
                      loading = false;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Wrong Password ${error.toString()}");
                    });
                  }),

                  signUpOption()
                ],
              ),
            ),
          )
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgotPassword(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "Forgot Password?",
      style: TextStyle(color: Colors.white70),
      textAlign: TextAlign.right,
    ),
    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword())),
    ),
    );
  }
}
