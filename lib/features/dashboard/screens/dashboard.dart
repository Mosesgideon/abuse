import 'package:abuse/features/dashboard/screens/profile.dart';
import 'package:abuse/features/dashboard/screens/report.dart';
import 'package:abuse/features/dashboard/screens/reports.dart';
import 'package:abuse/features/dashboard/widgets/suspect_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appinfo.dart';
import 'call_services.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Crime Report',
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              child: Image.network(
                  'https://w7.pngwing.com/pngs/527/1004/png-transparent-violence-sign-child-abuse-bullying-miscellaneous-child-text-thumbnail.png'),
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16.0), child: DashBoardItems()),
      ),
    );
  }
}

class DashBoardItems extends StatefulWidget {
  // final Color color;

  const DashBoardItems({
    Key? key,
    // required this.color
  }) : super(key: key);

  @override
  State<DashBoardItems> createState() => _DashBoardItemsState();
}

class _DashBoardItemsState extends State<DashBoardItems> {
  final text = [
    'Summit a Report',
    'Reviews/Update Existing Report',
    "Profile",
    'Suspects Video',
    "Call Services",
    'App Info',
  ];
  final List<String> images = [
    'assets/png/send.png',
    'assets/png/message.png',
    'assets/png/profile.png',
    'assets/png/wanted.png',
    'assets/png/call.png',
    'assets/png/info.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/png/ng.jpg'), fit: BoxFit.cover)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
              child: Text(
            "EYEWITNESS CRIME REPORT",
            style: TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600),
          )),
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final urlImage = images[index];
              final txt = text[index];
              return CardBuild(urlImage, index, context, txt);
            }),
      ],
    );
  }
}

Widget CardBuild(
        String urlImage, int index, BuildContext context, String txt) =>
    InkWell(
      onTap: () {
        if (txt == "Summit a Report") {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (index) => ReportPage()));
        } else if (txt == 'Reviews/Update Existing Report') {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (index) => const Reports()));
        } else if (txt == 'Profile') {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (index) => const Profile()));
        } else if (txt == 'Suspects Video') {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (index) => const SuspectVideo()));
        } else if (txt == 'Call Services') {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (index) => const CallServices()));
        } else if (txt == 'App Info') {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (index) => const AppInfo()));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(2, 2))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image(
                image: AssetImage(urlImage),
                height: 80,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                txt,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
