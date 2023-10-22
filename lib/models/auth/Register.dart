/// success : true
/// message : "Registrasi berhasil"
/// data : {"fullname":"Agus Kurniadin Khaer","email":"aguskkhaer@gmail.com","updated_at":"2023-10-21T07:56:57.000000Z","created_at":"2023-10-21T07:56:57.000000Z","user_id":2}

class Register {
  Register({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Register.fromJson(dynamic json) {
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

/// fullname : "Agus Kurniadin Khaer"
/// email : "aguskkhaer@gmail.com"
/// updated_at : "2023-10-21T07:56:57.000000Z"
/// created_at : "2023-10-21T07:56:57.000000Z"
/// user_id : 2

class Data {
  Data({
      String? fullname, 
      String? email, 
      String? updatedAt, 
      String? createdAt, 
      int? userId,}){
    _fullname = fullname;
    _email = email;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _userId = userId;
}

  Data.fromJson(dynamic json) {
    _fullname = json['fullname'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _userId = json['user_id'];
  }
  String? _fullname;
  String? _email;
  String? _updatedAt;
  String? _createdAt;
  int? _userId;

  String? get fullname => _fullname;
  String? get email => _email;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = _fullname;
    map['email'] = _email;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['user_id'] = _userId;
    return map;
  }

}