import 'dart:convert';

import 'package:first_app/login/Services/login_api_interface.dart';
import 'package:first_app/login/Services/login_view_service.dart';
import 'package:first_app/login/models/user.dart';
import 'package:local_auth/local_auth.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uuid/uuid.dart';


class AuthViewModel extends Model {
  String errorMsg = ''; 
  bool _rememberMe = false;
  bool _useBio = false;
  bool _stayLoggedIn = true;
  User _user;

  bool get rememberMe => _rememberMe;
  void handleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('remember_me', value);
    });
  }

  bool get useBio => _useBio;
  void handleUseBio(bool value) {
    _useBio = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('use_bio', value);
    });
  } 

  bool get stayLoggedIn => _stayLoggedIn;
  void handleStayLoggedIn(bool value) {
    _stayLoggedIn = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('stay_logged_in', value);
    });
  }

  void loadSettings() async {
    var _prefs = await SharedPreferences.getInstance();
    _useBio = _prefs.getBool('use_bio') ?? false;
    _rememberMe = _prefs.getBool('remember_me') ?? false;
    _stayLoggedIn = _prefs.getBool('stay_logged_in') ?? false;

    if (_stayLoggedIn) {
      User _savedUser;
      try {
        String _saved = _prefs.getString('user_data');
        print('Saved: $_saved');
        _savedUser = User.fromJson(json.decode(_saved));
      } catch (e) {
        print('User is Not Exist');
      }
      if (_useBio) {
        if (await biometrics()) {
          _user = _savedUser;
        }
      } else {
        _user = _savedUser;
      }
    }
    notifyListeners();
  }

  Future<bool> biometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint',
        useErrorDialogs: true,
        stickyAuth: false
      );
    } catch (e) {
      print('scan failed');
      print(e);
    }
    return authenticated;
  }

  User get user => _user;
  // 获取用户信息
  Future<User> getInfo(String token) async {
    try {
      var _data = await LoginApiService(auth: User(token: token)).get(apiUrl);
      var _newUser = User.fromJson(_data['data']);
      _newUser?.token = token;
      return _newUser;
    } catch (e) {
      print('加载失败');
      return null;
    }
  }

  Future<bool> login({
    @required String username,
    @required String password,
  }) async {
    var uuid = Uuid();
    String _username = username;
    String _password = password;
    // 模拟延时
    await Future.delayed(Duration(seconds: 2));
    print('Logging In => $_username, $_password');
    if (_rememberMe) {
      // 记录用户名
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('saved_username', _username);
      });
    }

    User _newUser = await getInfo(uuid.v4().toString());
    if (_newUser != null) {
      _user = _newUser;
      notifyListeners();
      // 保存数据
      SharedPreferences.getInstance().then((prefs) {
        var _save = json.encode(_user.toJson());
        print('Save Data:$_save');
        prefs.setString('user_data', _save);
      });
    }

    if (_newUser?.token == null || _newUser.token.isEmpty) return false;
    return true;
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
    // 退出登录清除数据
    SharedPreferences.getInstance().then((prefs){
      prefs.setString('user_data', null);
    });
  }
}
