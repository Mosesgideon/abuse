
import 'package:abuse/features/dashboard/screens/profile.dart';
import 'package:abuse/features/dashboard/screens/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'notifications.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        children: [
          SettingsItems(
            voidCallback: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (index) => Profile()));
            },
            text: 'Account',
            icon: Icons.person,
            subtitle: 'Account',
          ),
          SettingsItems(
            subtitle: 'check for notifications',
            voidCallback: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (index) => Notifications()));
            },
            text: 'Notifications',
            icon: Icons.notifications_none_outlined,
          ),
          SettingsItems(
            subtitle: 'freequently asked questions ',
            voidCallback: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (index)=>ReportPage()));
            },
            text: 'FAQ',
            icon: Icons.question_mark,
          ),
          SettingsItems(
            subtitle: 'need any help ',
            voidCallback: () {},
            text: 'Help and Support',
            icon: Icons.question_answer_outlined,
          ),
        ],
      ),
    );
  }
}

class SettingsItems extends StatefulWidget {
  IconData icon;
  VoidCallback voidCallback;
  Widget? widget;
  final String text, subtitle;

  SettingsItems({
    Key? key,
    required this.voidCallback,
    this.widget,
    required this.text,
    required this.icon,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<SettingsItems> createState() => _SettingsItemsState();
}

class _SettingsItemsState extends State<SettingsItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.voidCallback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            widget.widget ??
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
          ],
        ),
      ),
    );
  }
}
