/// success : true
/// message : "Data berhasil didapat"
/// data : [{"feed_id":1,"feed_title":"Feed 1","feed_category":"Celana","feed_desc":"feed","feed_image":"/storage/feeds/JEtiJ6NR0jcuWVTcqUEBmpHG61vDwbRgYrbtMoCE.png","created_at":"2023-10-17T05:15:21.000000Z","updated_at":"2023-10-17T06:16:26.000000Z"}]

class Feed {
  Feed({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Feed.fromJson(dynamic json) {
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

/// feed_id : 1
/// feed_title : "Feed 1"
/// feed_category : "Celana"
/// feed_desc : "feed"
/// feed_image : "/storage/feeds/JEtiJ6NR0jcuWVTcqUEBmpHG61vDwbRgYrbtMoCE.png"
/// created_at : "2023-10-17T05:15:21.000000Z"
/// updated_at : "2023-10-17T06:16:26.000000Z"

class Data {
  Data({
      int? feedId, 
      String? feedTitle, 
      String? feedCategory, 
      String? feedDesc, 
      String? feedImage, 
      String? createdAt, 
      String? updatedAt,}){
    _feedId = feedId;
    _feedTitle = feedTitle;
    _feedCategory = feedCategory;
    _feedDesc = feedDesc;
    _feedImage = feedImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _feedId = json['feed_id'];
    _feedTitle = json['feed_title'];
    _feedCategory = json['feed_category'];
    _feedDesc = json['feed_desc'];
    _feedImage = json['feed_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _feedId;
  String? _feedTitle;
  String? _feedCategory;
  String? _feedDesc;
  String? _feedImage;
  String? _createdAt;
  String? _updatedAt;

  int? get feedId => _feedId;
  String? get feedTitle => _feedTitle;
  String? get feedCategory => _feedCategory;
  String? get feedDesc => _feedDesc;
  String? get feedImage => _feedImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['feed_id'] = _feedId;
    map['feed_title'] = _feedTitle;
    map['feed_category'] = _feedCategory;
    map['feed_desc'] = _feedDesc;
    map['feed_image'] = _feedImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}