class Call{
  String callerId;
  String callerName;
  String callerPic;
  String receiverId;
  String receiverName;
  String receiverPic;
  String channelId;
  bool hasDialed;

  Call({this.callerId,this.callerName,this.callerPic,
  this.channelId,
  this.hasDialed,
  this.receiverId,this.receiverName,this.receiverPic});


  Map<String, dynamic> toMap(Call call){
    Map<String,dynamic> callMap = Map();

    callMap["caller_id"] = this.callerId;
    callMap["caller_name"] = this.callerName;
    callMap["caller_pic"] = this.callerPic;
    callMap["receiver_id"] = this.receiverId;
    callMap["receiver_name"] = this.receiverName;
    callMap["receiver_pic"] = this.receiverPic;
    callMap["channel_id"] = this.channelId;
    callMap["has_dialed"] = this.hasDialed;

    return callMap;

  }

  Call.fromMap(Map callMap){
    this.callerId = callMap["caller_id"];
    this.callerName = callMap["caller_name"];
    this.callerPic = callMap["caller_pic"];
    this.receiverId = callMap["receiver_id"];
    this.receiverName = callMap["receiver_name"];
    this.receiverPic = callMap["receiver_pic"];
    this.channelId = callMap["channel_id"];
    this.hasDialed = callMap["has_dialed"];
  }

}
