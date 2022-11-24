import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharesprefences_concept/screen/home_screen.dart';

class SharedPerfences extends StatefulWidget {
  const SharedPerfences({super.key});

  @override
  State<SharedPerfences> createState() => _SharedPerfencesState();
}

class _SharedPerfencesState extends State<SharedPerfences> {
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'age'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'password'),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();

                  preferences.setString(
                      'email', emailController.text.toString());
                  preferences.setString('age', ageController.text.toString());
                  preferences.setString('password', passwordController.text.toString());
                  preferences.setBool('isLogin', true).then((value) {
                    CircularProgressIndicator();
                  }).whenComplete(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  });
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "LogIn",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
