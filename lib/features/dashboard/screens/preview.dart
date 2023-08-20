import 'package:flutter/material.dart';
import '../../screens/widgets/button.dart';

class PreviewScreen extends StatefulWidget {
  final String abusetype;
  final String location;
  final String description;

  const PreviewScreen(
      {Key? key,
      required this.abusetype,
      required this.location,
      required this.description})
      : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Preview before Summit',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.abusetype,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.location,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.location_on_sharp)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            CustomButton(
              padding: const EdgeInsets.symmetric(vertical: 20),
                onPressed: () {

                },
                isExpanded: true,
                bgColor: Colors.black,
                child: const Text('Report')),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
