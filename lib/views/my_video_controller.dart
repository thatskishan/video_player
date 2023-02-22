import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoController extends StatefulWidget {
  final String myVideo;
  const MyVideoController({Key? key, required this.myVideo}) : super(key: key);

  @override
  State<MyVideoController> createState() => _MyVideoControllerState();
}

class _MyVideoControllerState extends State<MyVideoController>
    with TickerProviderStateMixin {
  VideoPlayerController? myVideoController;
  AnimationController? myVideo;
  ChewieController? myController;

  void initState() {
    // TODO: implement initState
    super.initState();

    myVideo = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );

    myVideoController = VideoPlayerController.asset(widget.myVideo)
      ..initialize().then(
        (value) => setState(() {}),
      );
    myController = ChewieController(
      videoPlayerController: myVideoController!,
      autoPlay: false,
      aspectRatio: 4 / 2,
    );
  }

  @override
  void dispose() {
    super.dispose();
    myVideoController!.dispose();
    myController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Video Player",
      //     style: GoogleFonts.poppins(),
      //   ),
      //   centerTitle: true,
      // ),
      body: Center(
        child: AspectRatio(
          aspectRatio: myVideoController!.value.aspectRatio,
          child: Chewie(
            controller: myController!,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
