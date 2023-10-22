/// success : true
/// message : "Data berhasil didapat"
/// data : [{"help_id":1,"help_name":"Bantuan","help_desc":"Bantuan","help_image":"/storage/helps/cNmYIhBgAFqG2gj590dPJSU1Ch2RXmCAvOZ8dHMi.jpg","created_at":"2023-10-17T05:15:46.000000Z","updated_at":"2023-10-17T05:15:46.000000Z"}]

class Help {
  Help({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Help.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;

  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// help_id : 1
/// help_name : "Bantuan"
/// help_desc : "Bantuan"
/// help_image : "/storage/helps/cNmYIhBgAFqG2gj590dPJSU1Ch2RXmCAvOZ8dHMi.jpg"
/// created_at : "2023-10-17T05:15:46.000000Z"
/// updated_at : "2023-10-17T05:15:46.000000Z"

class Data {
  Data({
      int? helpId, 
      String? helpName, 
      String? helpDesc, 
      String? helpImage, 
      String? createdAt, 
      String? updatedAt,}){
    _helpId = helpId;
    _helpName = helpName;
    _helpDesc = helpDesc;
    _helpImage = helpImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _helpId = json['help_id'];
    _helpName = json['help_name'];
    _helpDesc = json['help_desc'];
    _helpImage = json['help_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _helpId;
  String? _helpName;
  String? _helpDesc;
  String? _helpImage;
  String? _createdAt;
  String? _updatedAt;

  int? get helpId => _helpId;
  String? get helpName => _helpName;
  String? get helpDesc => _helpDesc;
  String? get helpImage => _helpImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['help_id'] = _helpId;
    map['help_name'] = _helpName;
    map['help_desc'] = _helpDesc;
    map['help_image'] = _helpImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}