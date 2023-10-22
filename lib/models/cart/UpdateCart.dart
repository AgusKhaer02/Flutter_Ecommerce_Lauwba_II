/// success : true
/// message : "Data berhasil diubah"
/// data : {"cart_id":15,"user_id":2,"product_id":1,"quantity":"2","created_at":"2023-10-21T21:00:46.000000Z","updated_at":"2023-10-21T21:24:21.000000Z"}

class UpdateCart {
  UpdateCart({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateCart.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// cart_id : 15
/// user_id : 2
/// product_id : 1
/// quantity : "2"
/// created_at : "2023-10-21T21:00:46.000000Z"
/// updated_at : "2023-10-21T21:24:21.000000Z"

class Data {
  Data({
      int? cartId, 
      int? userId, 
      int? productId, 
      String? quantity, 
      String? createdAt, 
      String? updatedAt,}){
    _cartId = cartId;
    _userId = userId;
    _productId = productId;
    _quantity = quantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _cartId = json['cart_id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _quantity = json['quantity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _cartId;
  int? _userId;
  int? _productId;
  String? _quantity;
  String? _createdAt;
  String? _updatedAt;

  int? get cartId => _cartId;
  int? get userId => _userId;
  int? get productId => _productId;
  String? get quantity => _quantity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = _cartId;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}