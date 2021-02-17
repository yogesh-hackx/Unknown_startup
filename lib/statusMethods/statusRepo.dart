import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

enum MediaType { image, video, text }

class WhatsappStory {
  final MediaType mediaType;
  final String media;
  final double duration;
  final String caption;
  final String when;
  final String color;

  WhatsappStory({
    this.mediaType,
    this.media,
    this.duration,
    this.caption,
    this.when,
    this.color,
  });
}

class Highlight {
  final String image;
  final String headline;

  Highlight({this.image, this.headline});
}

class Repository {
  static MediaType _translateType(String type) {
    if (type == "image") {
      return MediaType.image;
    }

    if (type == "video") {
      return MediaType.video;
    }

    return MediaType.text;
  }

  static Future<List<WhatsappStory>> getWhatsappStories(String userId) async {
    
    QuerySnapshot ds = await FirebaseMethods().getStatus(userId);
    
    final data = ds.docs;
    var dateFormat = DateFormat.jm();

    final res = data.map<WhatsappStory>((it) {
      DateTime time = (it["when"] as Timestamp).toDate();
      return WhatsappStory(
          caption: it['caption'],
          media: it['media'],
          duration: double.parse(it['duration']),
          when: dateFormat.format(time),
          mediaType: _translateType(it['mediaType']),
          color: it['color']);
    }).toList();

    return res;
  }
}