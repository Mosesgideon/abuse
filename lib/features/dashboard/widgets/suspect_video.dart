import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:abuse/features/dashboard/screens/video_upload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SuspectVideo extends StatefulWidget {
  const SuspectVideo({Key? key}) : super(key: key);

  @override
  State<SuspectVideo> createState() => _SuspectVideoState();
}

class _SuspectVideoState extends State<SuspectVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('abuse_report').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final videoUrl = snapshot.data!.docs[index].get('video');

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: AspectRatio(
                  aspectRatio: 16 /25,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                      // (p.basename(_videoFile!.path.trim())))
                    height: 300,
                    width: double.infinity,
                    child:VideoPlayerSreen(
                        snapshot.data!.docs[index].get('video')),
                    // VideoPlayer(
                    //   VideoPlayerController.network(
                    //       snapshot.data!.docs[index].get('video')),
                    // ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class VideoPlayerSreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerSreen(this.videoUrl, {super.key});

  @override
  _VideoPlayerSreenState createState() => _VideoPlayerSreenState();
}

class _VideoPlayerSreenState extends State<VideoPlayerSreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(), // Loading indicator
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}