import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharesprefences_concept/screen/shared_perfences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '';
  String age = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    email = preferences.getString('email') ?? '';
    age = preferences.getString('age') ?? '';
    password = preferences.getString('password') ?? '';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Email"),
              Text(
                email,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Age"),
              Text(
                age,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Password"),
              Text(
                password,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SharedPerfences()));
            },
            child: Container(
              color: Colors.blue,
              height: 50,
              width: double.infinity,
              child: Center(
                  child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
