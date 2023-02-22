import 'package:flutter/material.dart';
import 'package:your_tube/views/my_video_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    routes: {
      '/': (context) => const MyVideoList(),
    },
  ));
}
