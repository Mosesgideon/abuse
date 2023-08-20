import 'package:abuse/features/dashboard/screens/preview.dart';
import 'package:abuse/features/dashboard/screens/video_upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/widgets/button.dart';

//
// class ReportScreen extends StatefulWidget {
//   const ReportScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ReportScreen> createState() => _ReportScreenState();
// }
//
// class _ReportScreenState extends State<ReportScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: const Text(
//           'Report Abuse',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Column(),
//     );
//   }
// }

class ReportPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _type = '';
  String _location = '';
  String _abuser = '';
  String _description = '';

  void _submitReport(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Perform report submission logic here
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (index) => AddVideoScreen(
                location: locationcontroller.text,
                description: descriptioncontroller.text,
                abusetype: abusecontroller.text,
                abuser: abusercontroller.text,
              )));

      // For now, print the report details
      print('Type: $_type');
      print('Location: $_location');
      print('Description: $_description');
    }
  }

  final locationcontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final abusecontroller = TextEditingController();
  final abusercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Report Abuse',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: abusecontroller,
                  onChanged: (value) {
                    _type = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          gapPadding: 2,
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.grey.withOpacity(0.2),
                      hintText: 'Abuse type',
                      filled: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: abusercontroller,
                  onChanged: (value) {
                    _abuser = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          gapPadding: 2,
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.grey.withOpacity(0.2),
                      hintText: 'Name of suspect',
                      filled: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: locationcontroller,
                  onChanged: (value) {
                    _location = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          gapPadding: 2,
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.grey.withOpacity(0.2),
                      hintText: 'Location',
                      suffixIcon: const Icon(Icons.location_on_outlined),
                      filled: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: descriptioncontroller,
                  onChanged: (value) {
                    _description = value;
                  },
                  maxLines: 10,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    border: OutlineInputBorder(
                        gapPadding: 2,
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Description',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 200,
                      child: CustomButton(
                          onPressed: () {
                            _submitReport(context);
                            // Navigator.of(context).push(CupertinoPageRoute(
                            //     builder: (index) => AddVideoScreen(
                            //           location: locationcontroller.text,
                            //           description: descriptioncontroller.text,
                            //           abusetype: abusecontroller.text,
                            //         )));
                          },
                          bgColor: Colors.black,
                          child: const Text('Preview')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
