import 'dart:async';
import 'dart:io';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/screens/user_profile.dart';
import 'package:application_unknown/utilies/unseen_utilities.dart';
import 'package:application_unknown/widgets/delete_message.dart';
import 'package:application_unknown/widgets/document_two.dart';
import 'package:application_unknown/widgets/document_one.dart';
import 'package:application_unknown/widgets/gif_ui.dart';
import 'package:application_unknown/widgets/image_ui.dart';
import 'package:application_unknown/widgets/user_one.dart';
import 'package:application_unknown/widgets/user_two.dart';
import 'package:application_unknown/widgets/video_ui.dart';
import 'package:chat_pickers/chat_pickers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

class ChatScreen extends StatefulWidget {
  final String peerUsername, peerphoneNumber, peerId, chatRoomId;

  ChatScreen({
    Key key,
    this.peerUsername,
    this.peerphoneNumber,
    this.peerId,
    this.chatRoomId,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Stream messageStream;
  ScrollController msgController = ScrollController();

  double chatLength;
  bool isUploading = false;

  bool isOnline = false;
  bool isTyping = false;
  StreamSubscription typing;
  StreamSubscription online;

  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController messageController = TextEditingController();

  FocusNode focusNode = FocusNode();

  bool _sendEmoji = false;

  requestfocus(context) {
    FocusScope.of(context).unfocus();
    //focusNode.requestFocus();
    focusNode.requestFocus();
  }

  unfocus() {
    focusNode.unfocus();
    updateTypingIndicator(false);
  }

  deleteMessage(String messageUid, BuildContext context) async {
    Navigator.pop(context);
    Map<String, dynamic> deleteMessageMap = {"type": "deleted"};

    return FirebaseMethods()
        .deleteMessage(messageUid, widget.chatRoomId, deleteMessageMap);
  }

  swipeleft(BuildContext context, String messageUid) {
    unfocus();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 250,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "More options",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900, fontSize: 22),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Colors.black54,
                          )),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.teal[200],
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.teal[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Favourites",
                                style: GoogleFonts.nunito(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await deleteMessage(messageUid, context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  color: Colors.orange[200],
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.orange[700],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Delete",
                                style: GoogleFonts.nunito(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.cyan[200],
                              ),
                              child: Icon(
                                Icons.forward,
                                color: Colors.cyan[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Forward",
                                style: GoogleFonts.nunito(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.deepPurple[200],
                              ),
                              child: Icon(
                                Icons.copy_rounded,
                                color: Colors.deepPurple[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Copy",
                                style: GoogleFonts.nunito(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  getChatThreadId(String userUid1, String userUid2) {
    print(userUid2);
    if (userUid1.substring(0, 1).codeUnitAt(0) >
        userUid2.substring(0, 1).codeUnitAt(0)) {
      return userUid2 + "_" + userUid1;
    } else {
      return userUid1 + "_" + userUid2;
    }
  }

  sendMessage() {
    if (messageController.text != "") {
      Map<String, dynamic> typingIndicatorMap = {
        _auth.currentUser.uid: {"isTyping": false}
      };

      FirebaseMethods()
          .updateTypingIndicator(widget.chatRoomId, typingIndicatorMap);
      String message = messageController.text.trim();
      messageController.text = "";
      var lastMessageTs = DateTime.now();

      String chatRoomId = getChatThreadId(_auth.currentUser.uid, widget.peerId);

      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "sentBy": _auth.currentUser.uid,
        "DateTime": lastMessageTs,
        "isSeen": false,
        "receiverId": widget.peerId,
        "type": "text"
      };

      FirebaseMethods().sendMessage(chatRoomId, messageInfoMap);
      Map<String, dynamic> lastMessageInfoMap = {
        "lastMessage": message,
        "lastMessageSendTimeDate": lastMessageTs,
        "lastMessageSendBy": _auth.currentUser.uid,
        "chatRoomId": chatRoomId,
      };
      msgController.jumpTo(msgController.position.minScrollExtent);

      FirebaseMethods().updateLastMessageSent(chatRoomId, lastMessageInfoMap);
    }
  }

  getAndSetMessages() async {
    messageStream =
        await FirebaseMethods().getChatRoomMessages(widget.chatRoomId);
    setState(() {});
  }

  updateUnseenMessageCount() async {
    await FirebaseMethods()
        .updateUnseenMessages(widget.chatRoomId, _auth.currentUser.uid);
  }

  doThisOnLaunch() async {
    await getAndSetMessages();
    await updateUnseenMessageCount();
  }

  sendAttachMentMessage(File file, String fileName) async {
    try {
      if (mounted)
        setState(() {
          isUploading = true;
        });
      firebase_storage.TaskSnapshot uploadTask =
          await storage.ref(widget.chatRoomId + "/" + fileName).putFile(file);
      var lastMessageTs = DateTime.now();
      var imageUrl = await uploadTask.ref.getDownloadURL();
      var url = imageUrl.toString();
      print(url);

      Map<String, dynamic> messageInfoMap = {
        "message": "doc",
        "sentBy": _auth.currentUser.uid,
        "DateTime": lastMessageTs,
        "isSeen": false,
        "receiverId": widget.peerId,
        "type": "doc",
        "downloadUrl": url,
        "fileName": fileName,
        "path": file.path
      };

      FirebaseMethods()
          .sendMessage(widget.chatRoomId, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": "doc",
          "lastMessageSendTimeDate": lastMessageTs,
          "lastMessageSendBy": _auth.currentUser.uid,
          "chatRoomId": widget.chatRoomId,
          "messageId": value
        };
        FirebaseMethods()
            .updateLastMessageSent(widget.chatRoomId, lastMessageInfoMap);
        if (mounted) {
          setState(() {
            isUploading = false;
          });
        }
      });
    } catch (e) {
      if (mounted)
        setState(() {
          isUploading = false;
        });
    }
  }

  sendIndividualAttachMentMessage(File file, String fileName) async {
    await sendAttachMentMessage(file, fileName);
  }

  uploadDocuments(BuildContext context) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: true, allowedExtensions: ["pdf"], type: FileType.custom);
    if (result != null) {
      Navigator.pop(context);
      List<File> file = result.paths.map((e) => File(e)).toList();
      await file.forEach((file) async {
        await sendIndividualAttachMentMessage(file, basename(file.path));
      });
    }
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: messageStream,
      builder: (context, snapShot) {
        if (snapShot.hasData && snapShot.data != null) {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            controller: msgController,
            reverse: true,
            itemCount: snapShot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapShot.data.docs[index];
              if (ds["type"] == "text") {
                return _auth.currentUser.uid == ds["sentBy"]
                    ? UserOne(
                        msg: ds["message"],
                        requestfocus: requestfocus,
                        swipeleft: swipeleft,
                        messageUid: snapShot.data.docs[index].id,
                        deleteMessage: deleteMessage,
                        chatRoomId: widget.chatRoomId,
                      )
                    : User2(
                        msg: ds["message"],
                      );
              } else if (ds["type"] == "doc") {
                return _auth.currentUser.uid == ds["sentBy"]
                    ? Document(
                        fileName: ds["fileName"],
                        chatRoomId: widget.chatRoomId,
                        downloadUrl: ds["downloadUrl"],
                        senderUid: ds["sentBy"],
                        path: ds["path"],
                      )
                    : Document2(
                        fileName: ds["fileName"],
                        chatRoomId: widget.chatRoomId,
                        downloadUrl: ds["downloadUrl"],
                        senderUid: ds["sentBy"],
                        path: ds["path"],
                      );
              } else if (ds["type"] == "image") {
                return Images(
                  path: ds["path"],
                  url: ds["downloadUrl"],
                  senderUid: ds["sentBy"],
                  fileName: ds["fileName"],
                );
              } else if (ds["type"] == "deleted") {
                return DeleteOne();
              } else if (ds["type"] == "gif") {
                return Gif1(url: ds["url"]);
              } else if (ds["type"] == "video") {
                return Video(
                    url: ds["downloadUrl"],
                    fileName: ds["fileName"],
                    senderUid: ds["sentBy"],
                    path: ds["path"]);
              }
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  getImage(ImageSource source, BuildContext context) async {
    PickedFile image =
        await ImagePicker().getImage(source: source, imageQuality: 100);

    print("Initially : ${File(image.path).lengthSync()}");

    if (image != null) {
      Navigator.pop(context);
      File croppedImage = await ImageCropper.cropImage(
          sourcePath: image.path,
          compressQuality: 100,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: "Unknown StartUp",
              toolbarColor: Colors.indigo[700],
              backgroundColor: Colors.white));

      Directory targetpath = await getExternalStorageDirectory();
      String fileName = basename(croppedImage.path);
      print(fileName);
      String targetPath = targetpath.path + "/$fileName";
      print(targetPath);

      File result = await FlutterImageCompress.compressAndGetFile(
          croppedImage.absolute.path, targetPath,
          quality: 25);

      print("Finally : ${result.lengthSync()}");

      return result;
    } else {
      return;
    }
  }

  sendImage(ImageSource source, BuildContext context) async {
    File image = await getImage(source, context);
    print(image.path);

    String fileName = basename(image.path);

    return await sendImageMessage(image, fileName);
  }

  sendImageMessage(File imageFile, String fileName) async {
    try {
      DateTime lastMessageTs = DateTime.now();
      firebase_storage.TaskSnapshot imageTask = await storage
          .ref(widget.chatRoomId + "/" + fileName)
          .putFile(imageFile);
      String url = await imageTask.ref.getDownloadURL();
      String path = imageFile.path;

      Map<String, dynamic> messageInfoMap = {
        "message": "image",
        "sentBy": _auth.currentUser.uid,
        "DateTime": lastMessageTs,
        "isSeen": false,
        "receiverId": widget.peerId,
        "type": "image",
        "downloadUrl": url,
        "fileName": fileName,
        "path": path,
      };

      FirebaseMethods()
          .sendMessage(widget.chatRoomId, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": "image",
          "lastMessageSendTimeDate": lastMessageTs,
          "lastMessageSendBy": _auth.currentUser.uid,
          "chatRoomId": widget.chatRoomId,
          "messageId": value
        };

        FirebaseMethods()
            .updateLastMessageSent(widget.chatRoomId, lastMessageInfoMap);
      });
    } catch (e) {
      print(e);
    }
  }

  sendVideoMessage(File videoFile, String fileName) async {
    try {
      DateTime lastMessageTs = DateTime.now();
      firebase_storage.TaskSnapshot imageTask = await storage
          .ref(widget.chatRoomId + "/" + fileName)
          .putFile(videoFile);
      String url = await imageTask.ref.getDownloadURL();
      String path = videoFile.path;

      Map<String, dynamic> messageInfoMap = {
        "message": "video",
        "sentBy": _auth.currentUser.uid,
        "DateTime": lastMessageTs,
        "isSeen": false,
        "receiverId": widget.peerId,
        "type": "video",
        "downloadUrl": url,
        "fileName": fileName,
        "path": path,
      };

      FirebaseMethods()
          .sendMessage(widget.chatRoomId, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": "video",
          "lastMessageSendTimeDate": lastMessageTs,
          "lastMessageSendBy": _auth.currentUser.uid,
          "chatRoomId": widget.chatRoomId,
          "messageId": value
        };

        FirebaseMethods()
            .updateLastMessageSent(widget.chatRoomId, lastMessageInfoMap);
      });
    } catch (e) {
      print(e);
    }
  }

  sendVideo() async {
    FilePickerResult pickedFile = await FilePicker.platform
        .pickFiles(type: FileType.video, allowCompression: true);
    print(pickedFile.files.first.path);

    PlatformFile pFile = pickedFile.files.first;

    print(pFile.size);

    MediaInfo mediaInfo = await VideoCompress.compressVideo(
      pFile.path,
      quality: VideoQuality.LowQuality,
    );

    print(await mediaInfo.file.length());

    return await sendVideoMessage(
        mediaInfo.file, basename(mediaInfo.file.path));
  }

  sendMessageGifs(String gifUrl) {
    setState(() {
      _sendEmoji = false;
    });
    var lastMessageTs = DateTime.now();

    String chatRoomId = getChatThreadId(_auth.currentUser.uid, widget.peerId);

    Map<String, dynamic> messageInfoMap = {
      "sentBy": _auth.currentUser.uid,
      "DateTime": lastMessageTs,
      "isSeen": false,
      "receiverId": widget.peerId,
      "type": "gif",
      "url": gifUrl
    };

    FirebaseMethods().sendMessage(chatRoomId, messageInfoMap).then((value) {
      Map<String, dynamic> lastMessageInfoMap = {
        "lastMessage": "gif",
        "lastMessageSendTimeDate": lastMessageTs,
        "lastMessageSendBy": _auth.currentUser.uid,
        "chatRoomId": chatRoomId,
      };
      msgController.jumpTo(msgController.position.minScrollExtent);

      FirebaseMethods().updateLastMessageSent(chatRoomId, lastMessageInfoMap);
    });
  }

  Widget sendEmojiGifs() {
    return ChatPickers(
      chatController: messageController,
      emojiPickerConfig: EmojiPickerConfig(
          bgBarColor: Colors.indigo[700],
          bgColor: Colors.white,
          columns: 8,
          numRecommended: 6),
      giphyPickerConfig: GiphyPickerConfig(
          apiKey: "IfgkunSn7vX9rER8piHH2QkBfAj4Fcln",
          onSelected: (gif) {
            print(gif.images.original.url);
            sendMessageGifs(gif.images.original.url);
          }),
    );
  }

  updateTypingIndicator(bool value) async {
    Map<String, dynamic> typingIndicatorMap = {
      _auth.currentUser.uid: {"isTyping": value}
    };

    await FirebaseMethods()
        .updateTypingIndicator(widget.chatRoomId, typingIndicatorMap);
  }

  addSubcription() {
    typing = FirebaseMethods()
        .getTypingIndicator(widget.chatRoomId)
        .listen((DocumentSnapshot ds) {
      if (ds.exists) {
        if (ds.data()[widget.peerId] != null) {
          if (ds.data()[widget.peerId]["isTyping"] == true) {
            setState(() {
              isTyping = true;
            });
          } else {
            setState(() {
              isTyping = false;
            });
          }
        }
      }
    });

    online = FirebaseMethods()
        .getOnlineIndicator(widget.peerId)
        .listen((DocumentSnapshot ds) {
      if (ds.exists) {
        if (ds.data() != null) {
          if (ds.data()["isOnline"] == true) {
            setState(() {
              isOnline = true;
            });
          } else {
            setState(() {
              isOnline = false;
            });
          }
        }
      }
    });
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();

    addSubcription();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          _sendEmoji = false;
        });
      }
    });
  }

  onEnd() async {
    await updateTypingIndicator(false);
  }

  @override
  void dispose() {
    onEnd();
    messageController.dispose();
    typing.cancel();
    online.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return UnseenMessage(
      chatRoomId: widget.chatRoomId,
      uid: _auth.currentUser.uid,
      scaffold: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black87,
            ),
            title: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile(
                                    currentUserUid: _auth.currentUser.uid,
                                    currentUserName: "Ashutosh Singh",
                                    profileUserUid: widget.peerId,
                                    profileUserName: widget.peerUsername,
                                  )));
                    },
                    child: Text(
                      widget.peerUsername,
                      style: GoogleFonts.nunito(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    isTyping
                        ? "typing...."
                        : isOnline
                            ? "online"
                            : "last seen today at 10:30am",
                    style: GoogleFonts.nunito(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 20, top: 10),
                child: Icon(
                  Icons.more_vert_rounded,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
        body: chatMessages(),
        bottomNavigationBar: SizedBox(
          child: Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 5),
                      width: 270,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300],
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: TextField(
                        focusNode: focusNode,
                        controller: messageController,
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.nunito(),
                        onChanged: (String changedMsg) async {
                          if (changedMsg.length > 0) {
                            await updateTypingIndicator(true);
                          } else {
                            await updateTypingIndicator(false);
                          }
                        },
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              unfocus();
                              focusNode.canRequestFocus = false;
                              setState(() {
                                _sendEmoji = !_sendEmoji;
                              });
                              unfocus();
                            },
                            child: Icon(
                              Icons.emoji_emotions_rounded,
                              color: Colors.indigo[800],
                            ),
                          ),
                          hintText: "Type your message here..",
                          hintStyle: GoogleFonts.nunito(
                              fontWeight: FontWeight.w800,
                              color: Colors.black87),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, bottom: 15, top: 5),
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.indigo[700],
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        sendMessage();
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, bottom: 15, top: 5),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.indigo[700],
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Icon(
                          Icons.attach_file,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        unfocus();
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                height: 320,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                              top: 30,
                                              bottom: 15),
                                          child: Text(
                                            "Attach Media",
                                            style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 22),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                              top: 30,
                                              bottom: 15),
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.black54,
                                              )),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 40, right: 40, top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    uploadDocuments(context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000),
                                                      color: Colors.teal[200],
                                                    ),
                                                    child: Icon(
                                                      Icons.upload_file,
                                                      color: Colors.teal[700],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    "Documents",
                                                    style: GoogleFonts.nunito(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1000),
                                                    color: Colors.orange[200],
                                                  ),
                                                  child: Icon(
                                                    Icons.headset_rounded,
                                                    color: Colors.orange[700],
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    "Audio",
                                                    style: GoogleFonts.nunito(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ), //Audio
                                          Container(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    await sendImage(
                                                        ImageSource.camera,
                                                        context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000),
                                                      color: Colors.cyan[200],
                                                    ),
                                                    child: Icon(
                                                      Icons.camera_alt,
                                                      color: Colors.cyan[700],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    "Camera",
                                                    style: GoogleFonts.nunito(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 40, right: 40, top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    print("gallery!!!");
                                                    await sendImage(
                                                        ImageSource.gallery,
                                                        context);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000),
                                                      color: Colors
                                                          .deepPurple[200],
                                                    ),
                                                    child: Icon(
                                                      Icons.photo_library,
                                                      color: Colors
                                                          .deepPurple[700],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    "Image Gallery",
                                                    style: GoogleFonts.nunito(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    print("gallery!!!");
                                                    await sendImage(
                                                        ImageSource.gallery,
                                                        context);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000),
                                                      color: Colors.red[200],
                                                    ),
                                                    child: Icon(
                                                      Icons.contacts_rounded,
                                                      color: Colors.red[700],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    "Contacts",
                                                    style: GoogleFonts.nunito(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    await sendVideo();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000),
                                                      color: Colors.lime[200],
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .video_library_rounded,
                                                      color: Colors.lime[900],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    "Video Gallery",
                                                    style: GoogleFonts.nunito(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      }, //show modal
                    ),
                  ],
                ),
                Container(height: !_sendEmoji ? 0 : 270, child: sendEmojiGifs())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
