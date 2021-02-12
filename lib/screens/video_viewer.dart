import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewer extends StatefulWidget {
  final String url;
  final String fileName;
  final double aspectRatio;
  final String path;
  
  VideoViewer({Key key, this.fileName,this.url,this.aspectRatio,this.path});

  @override
  _VideoViewerState createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.path));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
      // Try playing around with some of these other options:
      aspectRatio: widget.aspectRatio,
      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      autoInitialize: true,
    );
    setState(() {});
  }

  void dispose() {
      _videoPlayerController.dispose();
      _chewieController.dispose();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.fileName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.fileName),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _chewieController != null &&
                        _chewieController
                            .videoPlayerController.value.initialized
                    ? Chewie(
                        controller: _chewieController,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text('Loading'),
                        ],
                      ),
              
      ),
          ),
          ],
          ),
          ),
          );
}
}