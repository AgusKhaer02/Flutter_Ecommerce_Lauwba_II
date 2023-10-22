/// success : true
/// message : "Data berhasil didapat"
/// data : [{"category_id":1,"category_name":"Celana","category_desc":"Ini celana","category_image":"/storage/categories/O1BHP67BSfsnUjzg8W4oBmkYZa5vudvauEvnVq8c.jpg","created_at":"2023-10-17T05:13:39.000000Z","updated_at":"2023-10-17T05:13:39.000000Z"}]

class Subcategory {
  Subcategory({
    bool? success,
    String? message,
    List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
  }

  Subcategory.fromJson(dynamic json) {
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

/// category_id : 1
/// category_name : "Celana"
/// category_desc : "Ini celana"
/// category_image : "/storage/categories/O1BHP67BSfsnUjzg8W4oBmkYZa5vudvauEvnVq8c.jpg"
/// created_at : "2023-10-17T05:13:39.000000Z"
/// updated_at : "2023-10-17T05:13:39.000000Z"

class Data {
  Data({
    int? categoryId,
    String? categoryName,
    String? categoryDesc,
    String? categoryImage,
    String? createdAt,
    String? updatedAt,}){
    _categoryId = categoryId;
    _categoryName = categoryName;
    _categoryDesc = categoryDesc;
    _categoryImage = categoryImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
    _categoryDesc = json['category_desc'];
    _categoryImage = json['category_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _categoryId;
  String? _categoryName;
  String? _categoryDesc;
  String? _categoryImage;
  String? _createdAt;
  String? _updatedAt;

  int? get categoryId => _categoryId;
  String? get categoryName => _categoryName;
  String? get categoryDesc => _categoryDesc;
  String? get categoryImage => _categoryImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['category_name'] = _categoryName;
    map['category_desc'] = _categoryDesc;
    map['category_image'] = _categoryImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}