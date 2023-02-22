import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  factory UserPreferences() => _instancia;
  UserPreferences._internal();
  static final UserPreferences _instancia = UserPreferences._internal();

  late SharedPreferences _prefs;

  Future<void> clear() async {
    await _prefs.clear();
  }

  Future<SharedPreferences> initPrefs() async =>
      _prefs = await SharedPreferences.getInstance();

  // GET y SET del token
  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  // GET y SET del imagenes
  String get imagesUrl {
    return _prefs.getString('imagesUrl') ?? '';
  }

  set imagesUrl(String value) {
    _prefs.setString('imagesUrl', value);
  }

  // GET y SET del gmaps
  String get gmaps {
    return _prefs.getString('gmaps') ?? '';
  }

  set gmaps(String value) {
    _prefs.setString('gmaps', value);
  }

  // GET y SET del user
  String get user {
    return _prefs.getString('user') ?? '';
  }

  set user(String value) {
    _prefs.setString('user', value);
  }

  // GET y SET last page
  int get lastPage {
    return _prefs.getInt('lastPage') ?? 1;
  }

  set lastPage(int value) {
    _prefs.setInt('lastPage', value);
  }
}
