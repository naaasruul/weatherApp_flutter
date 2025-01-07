import 'package:flutter/material.dart';
import 'package:mudahjev3/Widgets/MyAppBar.dart';
import 'package:quickalert/quickalert.dart';
import 'package:mudahjev3/Utils/constant.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:video_player/video_player.dart';

class NoteVideo extends StatefulWidget {
  final Map<String, dynamic> content;

  NoteVideo({required this.content});

  @override
  State<NoteVideo> createState() => _NoteVideoState();
}

class _NoteVideoState extends State<NoteVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Placeholder
          CarouselSlider(
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction:1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.amber),
                      child: _controller.value.isInitialized ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                          : Center(child: CircularProgressIndicator()),
                  );
                },
              );
            }).toList(),
          ),

        ],
      ),
    );
  }
}
//
// Container(
// width: double.infinity,
// height: 400,
// color: Colors.grey[300],
// child: const Center(
// child: Icon(
// Icons.play_circle_fill,
// size: 50,
// color: Colors.grey,
// ),
// ),
// ),
// const SizedBox(height: 20),
//
// // Quiz Question
// Center(
// child:  Text(
// widget.content['title'],
// style: TextStyle(
// fontSize: 32,
// fontWeight: FontWeight.w500,
// color: Colors.black),
// ),
// ),
// const SizedBox(height: 10),
//
// // Submit Button
// Center(
// child: ElevatedButton(
// onPressed: () {
// // Handle submission
// QuickAlert.show(
// context: context,
// type: QuickAlertType.success,
// text: 'Quiz Completed!',
// autoCloseDuration: const Duration(seconds: 3),
// showConfirmBtn: true,
// backgroundColor: Color(kWhiteColor),
// confirmBtnColor: Color(kMainColor),
// );
// },
// style: ElevatedButton.styleFrom(
// backgroundColor: const Color(0xFFC90000),
// // Customize button color
// padding:
// const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// ),
// child: const Text(
// 'Submit',
// style: TextStyle(fontSize: 18, color: Colors.white),
// ),
// ),
// ),
