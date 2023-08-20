import 'package:flutter/material.dart';

class ProfileItems extends StatefulWidget {
  final String text;
  final Color? color;
  final IconData iconData;
  final Widget icons;
  VoidCallback voidCallback;

  ProfileItems(
      {Key? key,
      required this.text,
      required this.icons,
      required this.iconData,
      required this.voidCallback,
      this.color})
      : super(key: key);

  @override
  State<ProfileItems> createState() => _ProfileItemsState();
}

class _ProfileItemsState extends State<ProfileItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.voidCallback,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  widget.iconData,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 15),
                ),
                const Spacer(),
                widget.icons ??
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
