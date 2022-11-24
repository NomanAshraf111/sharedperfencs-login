import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharesprefences_concept/screen/shared_perfences.dart';

import 'home_screen.dart';


class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogin();
  }

  void islogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isLogin =   preferences.getBool('isLogin') ?? false;

  if(isLogin){
     Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
  }else{
     Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SharedPerfences()));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 7,
        ),
      ),
    );
  }
}