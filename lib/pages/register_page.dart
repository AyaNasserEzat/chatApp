import 'dart:js';

import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/SnackBar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String?  passwored;
  String? email;
bool isloading=false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Form(
          key: formKey,
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
                      'Register',
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
                    passwored = data;
                  },
                  hintText: 'password',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading=true;
                      setState(() {

                      });
                      try {
                        await Register();
                        Navigator.pushNamed(context, 'chatBubblePage',arguments: email!);

                      } on FirebaseAuthException catch (e) {
                        print(e);
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        } else if (e.code == 'invalid-email') {
                          showSnackBar(context, 'invalid-email');
                        }
                      } catch (e) {
                        showSnackBar(context, '$e');
                      }
                      isloading=false;setState(() {

                      });
                    }
                    else {
                    }

                  },
                  text: 'Register',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'aleardy have an acount? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'login',
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

  Future<void> Register() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: passwored!,
    );
  }
}
