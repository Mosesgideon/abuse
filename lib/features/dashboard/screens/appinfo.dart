import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),

        elevation: 0,
        title: const Text(
          "About",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Version.....(beta version)",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Copyright(C)Interactive 2023.All rights reserved",
                  style: TextStyle(
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "App Info",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "A Mobile Computerized Child Abuse Database Management System",
                  style: TextStyle(
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Terms And Conditions",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "By using view chat, you agree to view chat terms and privacy",
                  style: TextStyle(
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Developer's email",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 2,spreadRadius: 1,
                        offset: const Offset(0,2)
                      )
                    ]
                  ),
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            launch("mailto:mosesgideon072@gmail.com?subject=I need a Mobile app ");

                          },
                          child: const Text(
                          "mosesgideon072@gmail.com",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                // boxShadow: [
                                //   BoxShadow(
                                //       color: Colors.grey.withOpacity(0.5),
                                //       blurRadius: 3,
                                //       spreadRadius: 2,
                                //       offset: const Offset(0, 3))
                                // ]
                              ),
                            child: IconButton(
                              onPressed: () {
                                launch("tel:+234 7042973460");
                                print('clicked me');

                              },
                              icon: Icon(Icons.call),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Support",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                  )                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Please leave question,bugs reports or comments on the forum,Alternatively you can reach us @programmersCity or 07042973460 or 08163875505.",
                  style: TextStyle(
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
