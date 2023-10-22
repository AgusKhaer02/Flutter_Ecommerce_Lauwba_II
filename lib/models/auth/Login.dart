/// success : true
/// message : "Login berhasil"
/// data : {"user_id":2,"fullname":"Agus Kurniadin Khaer","email":"aguskkhaer@gmail.com","is_admin":0,"created_at":"2023-10-21T07:56:57.000000Z","updated_at":"2023-10-21T07:56:57.000000Z"}

class Login {
  Login({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Login.fromJson(dynamic json) {
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

/// user_id : 2
/// fullname : "Agus Kurniadin Khaer"
/// email : "aguskkhaer@gmail.com"
/// is_admin : 0
/// created_at : "2023-10-21T07:56:57.000000Z"
/// updated_at : "2023-10-21T07:56:57.000000Z"

class Data {
  Data({
      int? userId, 
      String? fullname, 
      String? email, 
      int? isAdmin, 
      String? createdAt, 
      String? updatedAt,}){
    _userId = userId;
    _fullname = fullname;
    _email = email;
    _isAdmin = isAdmin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _fullname = json['fullname'];
    _email = json['email'];
    _isAdmin = json['is_admin'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _userId;
  String? _fullname;
  String? _email;
  int? _isAdmin;
  String? _createdAt;
  String? _updatedAt;

  int? get userId => _userId;
  String? get fullname => _fullname;
  String? get email => _email;
  int? get isAdmin => _isAdmin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['fullname'] = _fullname;
    map['email'] = _email;
    map['is_admin'] = _isAdmin;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}