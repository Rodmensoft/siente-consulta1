import 'package:siente_app/app/data/provider/auth_api.dart';
import 'package:get/instance_manager.dart';

class AuthService {
  final AuthApi _authApi = Get.find<AuthApi>();

  Future<bool> login({String? user, String? password}) {
    return _authApi.login(user!, password!);
  }
}
