import '../entity/network_response.dart';

abstract class AuthRepo {
  Future<NetworkResponse> sendSms(String phoneNumber);

  Future<NetworkResponse> confirm({
    required String phoneNumber,
    required String verificationCode,
  });
}
