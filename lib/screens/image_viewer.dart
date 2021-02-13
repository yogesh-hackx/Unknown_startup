import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatefulWidget {
  final String path;
  final bool mine;
  final String url;

  ImageViewer({Key key, this.mine, this.path, this.url});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      imageBuilder: (context,imageProvider){
        return Container(child: PhotoView(imageProvider: imageProvider));
      });
  }
}
