/// success : true
/// message : "Data berhasil didapat"
/// data : {"product_id":1,"subcategory_id":1,"product_name":"Levi's","product_desc":"Yakin ini celana","product_stock":20,"product_price":200000,"product_image":"https://ecommerce.aguskhaer.com/storage/products/FnbB1Xhd0833lrLMibCbWyOwcG8RiXsIcrYKDjvq.jpg","created_at":"2023-10-17T05:14:49.000000Z","updated_at":"2023-10-17T05:14:49.000000Z"}

class ProductDetail {
  ProductDetail({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ProductDetail.fromJson(dynamic json) {
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

/// product_id : 1
/// subcategory_id : 1
/// product_name : "Levi's"
/// product_desc : "Yakin ini celana"
/// product_stock : 20
/// product_price : 200000
/// product_image : "https://ecommerce.aguskhaer.com/storage/products/FnbB1Xhd0833lrLMibCbWyOwcG8RiXsIcrYKDjvq.jpg"
/// created_at : "2023-10-17T05:14:49.000000Z"
/// updated_at : "2023-10-17T05:14:49.000000Z"

class Data {
  Data({
      int? productId, 
      int? subcategoryId, 
      String? productName, 
      String? productDesc, 
      int? productStock, 
      int? productPrice, 
      String? productImage, 
      String? createdAt, 
      String? updatedAt,}){
    _productId = productId;
    _subcategoryId = subcategoryId;
    _productName = productName;
    _productDesc = productDesc;
    _productStock = productStock;
    _productPrice = productPrice;
    _productImage = productImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _productId = json['product_id'];
    _subcategoryId = json['subcategory_id'];
    _productName = json['product_name'];
    _productDesc = json['product_desc'];
    _productStock = json['product_stock'];
    _productPrice = json['product_price'];
    _productImage = json['product_image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _productId;
  int? _subcategoryId;
  String? _productName;
  String? _productDesc;
  int? _productStock;
  int? _productPrice;
  String? _productImage;
  String? _createdAt;
  String? _updatedAt;

  int? get productId => _productId;
  int? get subcategoryId => _subcategoryId;
  String? get productName => _productName;
  String? get productDesc => _productDesc;
  int? get productStock => _productStock;
  int? get productPrice => _productPrice;
  String? get productImage => _productImage;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['subcategory_id'] = _subcategoryId;
    map['product_name'] = _productName;
    map['product_desc'] = _productDesc;
    map['product_stock'] = _productStock;
    map['product_price'] = _productPrice;
    map['product_image'] = _productImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}