import '../../domain/entity/network_response.dart';
import '../../domain/repository/auth_repo.dart';
import '../source/auth_source.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthSource _authSource;

  AuthRepoImpl(this._authSource);

  @override
  Future<NetworkResponse> sendSms(String phoneNumber) async {
    return await _authSource.sendSms(phoneNumber);
  }

  @override
  Future<NetworkResponse> confirm({
    required String phoneNumber,
    required String verificationCode,
  }) async {
    return await _authSource.confirm(
      phoneNumber: phoneNumber,
      verificationCode: verificationCode,
    );
  }
}
