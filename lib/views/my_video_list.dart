import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_tube/modal/videos_data.dart';
import 'package:your_tube/views/my_video_controller.dart';

class MyVideoList extends StatefulWidget {
  const MyVideoList({Key? key}) : super(key: key);

  @override
  State<MyVideoList> createState() => _MyVideoListState();
}

class _MyVideoListState extends State<MyVideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video Player",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: Global.myVideosList
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyVideoController(
                              myVideo: e['video'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image: AssetImage(e['image']), fit: BoxFit.cover),
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          e['name'],
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.grey.shade700),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }
}
