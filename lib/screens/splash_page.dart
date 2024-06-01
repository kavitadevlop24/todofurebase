
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_application/screens/login_page.dart';

import 'home_page.dart';
import 'signup_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCheck();
  }

  getUserCheck()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(LoginPage.USER_ID);
    print('User ID:  $userId');
    if(userId !=null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}