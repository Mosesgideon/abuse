import 'dart:developer';

import 'package:abuse/features/dashboard/screens/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../dashboard/screens/homescreen.dart';
import '../widgets/button.dart';
import '../widgets/textfilled_widget.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  late  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text("Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Create an account with us to get started .',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                OutlinedFormField(
                  controller: namecontroller,
                  hint: 'name',
                ),
                const SizedBox(
                  height: 20,
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              CupertinoPageRoute(builder: (index) => const Login()));
                        },
                        child:  const Text(
                          "already have an account",
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
                  onPressed: () {
                    userSignUp();
                  },
                  bgColor: Colors.black,
                  child: isloading
                      ? const SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator())
                      : const Text('SignUp'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  registerUser(User user) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Call the user's CollectionReference to add a new user
    return users.doc(user.uid).set({
      'id': user.uid,
      'name': namecontroller.text, //
      'email': emailcontroller.text,
      // 'password':passwordcontroller
    });
  }

  Future userSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (passwordcontroller.text.isNotEmpty ||
            namecontroller.text.isNotEmpty ||
            emailcontroller.text.isNotEmpty) {
          final userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailcontroller.text.trim(),
                  password: passwordcontroller.text.trim());

          if (userCredential.user != null) {
            await registerUser(userCredential.user!);
            setState(() {
              isloading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 1000),
                content: Text("SignUp Successful")));
            Navigator.of(context).pushReplacement(
                CupertinoPageRoute(builder: (index) => DashBoard()));
          }
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          isloading = false;
        });
        if (e.code == "email-already-in-use") {
          log(e.code);
          setState(() {
            isloading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 1000),
              content: Text(
                  " The email address is already in use by another account.")));
        } else if (e.code == "weak-too-password") {
          log(e.code);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 1000),
              content: Text("password too weak")));
        }
      } on FirebaseException catch (e) {
        log(e.toString());
        setState(() {
          isloading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 1000),
            content: Text(
              e.code.toString(),
            )));
      }
    }
  }
}
