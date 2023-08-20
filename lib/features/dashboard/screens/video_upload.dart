import 'package:abuse/features/dashboard/screens/dashboard.dart';
import 'package:abuse/features/screens/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddVideoScreen extends StatefulWidget {
  final String abusetype;
  final String location;
  final String description;
  final String abuser;

  const AddVideoScreen(
      {Key? key,
      required this.abusetype,
      required this.location,
      required this.description,
      required this.abuser})
      : super(key: key);

  @override
  _AddVideoScreenState createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  late bool isloading = false;
  File? _videoFile;

  Future<void> _pickVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadVideo() async {
    if (_videoFile != null) {
      final storageReference =
          FirebaseStorage.instance.ref().child('videos/${DateTime.now()}.mp4');
      final uploadTask = storageReference.putFile(_videoFile!);
      uploadTask.snapshotEvents.listen((event) async {
        switch (event.state) {
          case TaskState.error:
            setState(() {
              isloading = false;
            });
            print("faled");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(TaskState.error.toString())));
            break;
          case TaskState.running:
            setState(() {
              isloading = true;
            });
            print("loading");
            break;
          case TaskState.success:
            storageReference.getDownloadURL().then((value) async {
              await abuseReport(value);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: Text("Successful")));
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (index) => DashBoard()));
            });
            break;
          case TaskState.paused:
          // TODO: Handle this case.
          case TaskState.canceled:
          // TODO: Handle this case.
        }
      });
    }
  }

  Future<void> abuseReport(String vidUrl) async {
    CollectionReference abuse =
        FirebaseFirestore.instance.collection('abuse_report');

    // Call the user's CollectionReference to add a new report
    return await abuse
        .add({
          'abusetype': widget.abusetype,
          'abuser': widget.abuser,
          'location': widget.location,
          'description': widget.description,
          'description': widget.description,
          'video': vidUrl,
        })
        .then((value) => print("report added"))
        .catchError((error) => print("Failed to add report: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.white,
        title: const Text(
          ' Preview And Upload Video',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.abusetype,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.abuser,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.location,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Icon(Icons.location_on_sharp)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(0, 3))
                      ]),
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // if (_videoFile != null)
            //   VideoPlayerWidget(videoFile: _videoFile!),
            _videoFile != null
                ? Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 3))
                        ]),
                    child: Center(
                        child: Text((p.basename(_videoFile!.path.trim())))))
                : Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 3))
                        ]),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: _pickVideo,
                          icon: const Icon(
                            Icons.file_copy_outlined,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "select a video file",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )
                      ],
                    ),
                  ),
            const Spacer(),
            CustomButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                bgColor: isloading?Colors.black45:Colors.black,
                onPressed: _uploadVideo,
                child: isloading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                    :const Text("Upload"))
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;

  VideoPlayerWidget({required this.videoFile});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: SizedBox(
          height: 50,
          width: double.infinity,
          child: VideoPlayer(VideoPlayerController.file(widget.videoFile))),
    );
  }
}
