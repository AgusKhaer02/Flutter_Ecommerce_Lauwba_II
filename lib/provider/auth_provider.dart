import 'package:ecommerce_lauwba_new/repo/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const USERNAME = "username";
const EMAIL = "email";
const USERID = "user_id";
const FULLNAME = "fullname";
const PASSWORD = "password";

class AuthProvider with ChangeNotifier {
  bool isLoggedIn = false;
  bool isLoading = false;
  int userID = 0;
  String username = "";
  String email = "";
  String fullname = "";
  SharedPreferences? _pref;

  checkLoggedIn() async {
    _pref = await SharedPreferences.getInstance();
    bool userID = _pref!.containsKey(USERID);
    bool fullname = _pref!.containsKey(FULLNAME);
    bool email = _pref!.containsKey(EMAIL);
    if (userID && email && fullname) {
      isLoggedIn = true;

      notifyListeners();
    } else {
      isLoggedIn = false;
      notifyListeners();
    }
  }

  savePref(
      {required int userID,
      required String fullname,
      required String email}) async {
    _pref = await SharedPreferences.getInstance();
    _pref!.setInt(USERID, userID);
    _pref!.setString(FULLNAME, fullname);
    _pref!.setString(EMAIL, email);
    checkLoggedIn();
  }

  destroyPref() async {
    isLoading = true;
    notifyListeners();
    _pref = await SharedPreferences.getInstance();
    await _pref?.clear();
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
    checkLoggedIn();
  }

  getPref() async {
    _pref = await SharedPreferences.getInstance();
    checkLoggedIn();
    if (isLoggedIn) {
      userID = _pref!.getInt(USERID)!;
      fullname = _pref!.getString(FULLNAME)!;
      email = _pref!.getString(EMAIL)!;
      notifyListeners();
    }
  }

  //fetch Login
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    //tampilkan loading
    isLoading = true;
    notifyListeners();

    //kelompokan data menjadi 1 koleksi array
    Map<String, String> dataUser = {
      EMAIL: email,
      PASSWORD: password,
    };
    Map<String, dynamic>? result;

    //lakukan percobaan login
    try {
      final res = await Api.login(dataUser: dataUser);
      if (res.success!) {
        var data = res.data!;
        savePref(userID: data.userId!, fullname: data.fullname!, email: data.email!);
      }
      //jika sukses maka muncul pesan sukses
      result = {
        "success": res.success,
        "message": res.message,
      };
    } catch (err) {
      //jika error maka muncul pesan error
      result = {
        "success": false,
        "message": "Err : $err",
      };
    }

    isLoading = false;
    notifyListeners();

    return result;
  }

  Future<Map<String, dynamic>> register({
    required String fullname,
    required String email,
    required String password,
  }) async {
    //tampilkan loading
    isLoading = true;
    notifyListeners();

    Map<String, String> dataUser = {
      FULLNAME: fullname,
      EMAIL: email,
      PASSWORD: password,
    };
    Map<String, dynamic>? result;
    try {
      final res = await Api.register(dataUser: dataUser);
      if (res.success!) {
        var data = res.data!;
        savePref(userID: data.userId!, fullname: fullname, email: email);
      }
      result = {
        "success": res.success,
        "message": res.message,
      };
    } catch (err) {
      result = {
        "success": false,
        "message": "Err : $err",
      };
    }
    isLoading = false;
    notifyListeners();
    return result;
  }
}
