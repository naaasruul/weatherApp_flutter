import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:multi_video_player/multi_video_player.dart';
class NoteVideo extends StatefulWidget {
  final List<dynamic> content;
  final int currentIndex;

  NoteVideo({required this.content, required this.currentIndex});

  @override
  State<NoteVideo> createState() => _NoteVideoState();
}
class _NoteVideoState extends State<NoteVideo> {
  late List videoSources;

  int _currentIndex = 0; // To keep track of the current video in the carousel

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    print("DATA MAK AU:: ${widget.content}");
    videoSources = widget.content.map((item)=>item['url']!).toList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onPrevious() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  void _onNext() {
    setState(() {
      if (_currentIndex < 4) {
        _currentIndex++;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MultiVideoPlayer.network(
              height: 400,
              width: MediaQuery.of(context).size.width,
              videoSourceList: videoSources,
              scrollDirection: Axis.horizontal,
              preloadPagesCount: videoSources.length,
              onPageChanged: (videoPlayerController, index) {},
              getCurrentVideoController: (videoPlayerController) {},
            ),
          ),
          // Buttons Row at the bottom
          Spacer(),
        ],
      ),
    );
  }
}

