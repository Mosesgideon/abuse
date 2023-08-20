import 'package:abuse/features/dashboard/screens/dashboard.dart';
import 'package:abuse/features/screens/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../dashboard/screens/homescreen.dart';
import '../widgets/button.dart';
import '../widgets/textfilled_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  late bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Welcome back,',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Welcome back, Enter your details to continue .',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedFormField(
                controller: emailcontroller,
                hint: 'email',
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedFormField(
                controller: passwordcontroller,
                hint: 'password',
                obscure: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(builder: (index) => SignUp()));
                      },
                      child: const Text(
                        "don't have an account",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                onPressed: loginUser,
                bgColor: isloading?Colors.black45:Colors.black,
                child:isloading?const SizedBox(
                  height: 20,width: 20,
                    child: CircularProgressIndicator()): const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future loginUser() async {
    try {
      if (_formkey.currentState!.validate()) {
        setState(() {
          isloading = true;
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim());
        Navigator.of(context)
            .pushReplacement(
                CupertinoPageRoute(builder: (index) => const DashBoard()))
            .onError((error, stackTrace) {
          setState(() {
            isloading = false;
          });
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1000),
            content: Text(
                "There is no user record corresponding to this identifier")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1000),
            content: Text("incorrect password ")));
      }
    }
  }
}
