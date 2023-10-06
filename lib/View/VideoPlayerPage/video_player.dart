import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;

  VideoPlayerPage({required this.videoUrl, required this.videoTitle});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late BetterPlayerController _betterPlayerController;
  bool _isPlaying = false;
  int index = 0;

  List<String> urls = [
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
  ];

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, urls[index]);
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  _initializePlayer() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appDrawer(),
      /*appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: GradientText(
          'Video Player',
          style: GoogleFonts.poppins(
            fontSize: 19.0,
            fontWeight: FontWeight.w600
          ),
          gradientType: GradientType.linear,
          gradientDirection: GradientDirection.ttb,
          radius: .4,
          colors: [
            Colors.blue,
            Colors.green,
          ],
        ),
      ),*/
      body: Stack(
        children: [
          Positioned(
            top: 25,
            left: 25,
            child: Icon(
              Icons.menu,
              color: Colors.white,
              weight: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(controller: _betterPlayerController),
                // child: BetterPlayer.network(widget.videoUrl)
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  index == 0
                      ? Container()
                      : IconButton(
                          onPressed: () {
                            _betterPlayerController.dispose();
                            setState(() {
                              index = index - 1;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.blue,
                          ),
                          style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform login logic here
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.green]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Download',
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                            Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        ),
                      ),
                    ),
                  ),
                  index == urls.length - 1
                      ? Container()
                      : IconButton(
                          onPressed: () {
                            _betterPlayerController.dispose();
                            setState(() {
                              index = index + 1;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.green,
                          ),
                          style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  appDrawer() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
