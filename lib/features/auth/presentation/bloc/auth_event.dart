abstract class AuthEvent{

}

class SendSmsEvent extends AuthEvent{
  final String phoneNumber;
  SendSmsEvent(this.phoneNumber);
}

class ConfirmCodeEvent extends AuthEvent{
  final String phoneNumber;
  final String verificationCode;
  ConfirmCodeEvent({ required this.phoneNumber, required this.verificationCode});
}
