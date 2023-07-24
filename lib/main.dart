import 'package:chat/pages/chatBubble.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/widgets/CustomChatBubble.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// Import the generated file
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chatApp());
}

class chatApp extends StatelessWidget {
  const chatApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  routes: {
        'login':(context)=>login(),
        'Register':(context)=>RegisterPage(),
           'chatBubblePage':(context)=>chatBubblePage(),
  },
        initialRoute:'login'
    );
  }
}
