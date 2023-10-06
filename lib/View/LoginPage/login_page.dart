import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_mt/View/VideoPlayerPage/video_player.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Lottie.network(
              'https://assets6.lottiefiles.com/packages/lf20_mjlh3hcy.json', // Replace with your Lottie animation file path
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'MOBILE NUMBER',
                    hintStyle: GoogleFonts.poppins()
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>VideoPlayerPage(
                      videoTitle: 'Lilac Video Player',
                      videoUrl:
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    )
                    ),
                    );
                    // Perform login logic here

                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient:
                        const LinearGradient(colors: [Colors.blue, Colors.green]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 300,
                      height: 50,
                      alignment: Alignment.center,
                      child:  Text(
                        'SEND OTP',
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

