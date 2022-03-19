import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({Key? key}) : super(key: key);

  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {

  String? email;
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSharedPreference();
  }

  loadSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      token = prefs.getString('token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 800,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                email!,
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black54,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text(
                token!,
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black54,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    onPressed: (){
                      //action button logout
                      fetchLogout(context);
                    },
                    child: const Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                    color: const Color(0xFFF58634),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                    padding: const EdgeInsets.all(16),
                  )),
            ],
          ),),
      ),
    );
  }

  void fetchLogout(BuildContext context) async {
    // Remove data for the 'counter' key.
    final prefs = await SharedPreferences.getInstance();
    final removeEmail = await prefs.remove('email');
    final removeToken = await prefs.remove('token');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
  }
}
