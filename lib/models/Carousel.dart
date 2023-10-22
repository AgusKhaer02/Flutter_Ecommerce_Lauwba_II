/// success : true
/// message : "Data berhasil didapat"
/// data : [{"carousel_id":1,"carousel_image":"/storage/carousels/ZNc5rOQAarOpBZwyFuQd2JBOCd0c9SQ7WYHxUIEA.jpg","created_at":"2023-10-17T02:07:18.000000Z","updated_at":"2023-10-17T06:08:39.000000Z"},{"carousel_id":2,"carousel_image":"/storage/carousels/nI9RbXh2q9i1qmcbF5FxwMb1ITDySQS5fy78Urln.webp","created_at":"2023-10-17T06:08:49.000000Z","updated_at":"2023-10-17T06:08:49.000000Z"},{"carousel_id":3,"carousel_image":"/storage/carousels/Tiu48OnLa4X7YwqJhXRXq9uEkfj77plEMwOZmNZW.jpg","created_at":"2023-10-17T06:08:59.000000Z","updated_at":"2023-10-17T06:08:59.000000Z"},{"carousel_id":4,"carousel_image":"/storage/carousels/7JQHBnzbiQSTHAQilftmzVcQuDm2XFzpCCRwc8FW.webp","created_at":"2023-10-17T06:09:13.000000Z","updated_at":"2023-10-17T06:09:13.000000Z"}]

class Carousel {
  Carousel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Carousel.fromJson(dynamic json) {
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

/// carousel_id : 1
/// carousel_image : "/storage/carousels/ZNc5rOQAarOpBZwyFuQd2JBOCd0c9SQ7WYHxUIEA.jpg"
/// created_at : "2023-10-17T02:07:18.000000Z"
/// updated_at : "2023-10-17T06:08:39.000000Z"

class Data {
  Data({
      int? carouselId, 
      String? carouselImage, 
      String? createdAt, 
      String? updatedAt,}){
    _carouselId = carouselId;
    _carouselImage = carouselImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _carouselId = json['carousel_id'];
    _carouselImage = json['carousel_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _carouselId;
  String? _carouselImage;
  String? _createdAt;
  String? _updatedAt;

  int? get carouselId => _carouselId;
  String? get carouselImage => _carouselImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carousel_id'] = _carouselId;
    map['carousel_image'] = _carouselImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}