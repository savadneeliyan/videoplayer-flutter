import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lilac_mt/View/LoginPage/login_page.dart';
import 'package:lilac_mt/View/VideoPlayerPage/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage()
                  /*VideoPlayerPage(
                videoTitle: 'Lilac Video Player',
                videoUrl:
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              ),*/
            )));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/images/lilac_logo.png'),
                height: 200,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
