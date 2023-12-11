import 'package:r8it/domain/user/auth.dart';
import 'package:r8it/domain/user/info.dart';
import 'package:r8it/infrastructure/rit/rit_rest_client.dart';
import 'package:r8it/storage/vault.dart';

class RitRepository {
  late RitRestClient client;

  RitRepository._() {
    client = RitRestClient();
  }

  static RitRepository instance() {
    return RitRepository._();
  }

  Future<User> userInfo() async {
    return _authorized().then((args) {
      return client.userInfo();
    });
  }

  Future<void> _authorized() async {
    return await Vault.instance()
        .then((v) => v.getAuthToken())
        .then((token) => client.setBearerAuth(token));
  }

  Future<void> registerInit(RegisterRequest request) async {
    return client.registerInit(request);
  }

  Future<void> registerConfirm(RegisterOtpRequest request) async {
    return client.registerConfirm(request).then((t) => _updateToken(t));
  }

  Future<void> login(LoginRequest request) async {
    return client.login(request).then((t) => _updateToken(t));
  }

  Future<bool> _updateToken(String jwt) {
    return Vault.instance().then((v) => v.setAuthToken(jwt));
  }
}
