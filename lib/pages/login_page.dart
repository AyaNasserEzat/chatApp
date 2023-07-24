import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/SnackBar.dart';
class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String? email;

  bool isloading=false;

  String? password;
GlobalKey<FormState>formkey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Form(
          key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/scholar.png'),
              Text(
                'scholar chat',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextfield(
                onchange: (data) {
                  email = data;
                },
                hintText: 'email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextfield(
                onchange: (data) {
                  password = data;
                },
                hintText: 'password',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                ontap: () async {
                  if (formkey.currentState!.validate()) {
                    isloading=true;
                    setState(() {

                    });
                    try {
                      await Login();
                      Navigator.pushNamed(context, 'chatBubblePage',arguments: email!);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(
                            context, 'Wrong password provided for that user.');
                      }
                    }
                  }
                  isloading=false;
                  setState(() {

                  });
                },
                text: 'Login',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'dont have an acount? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'Register');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Future<void> Login() async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
