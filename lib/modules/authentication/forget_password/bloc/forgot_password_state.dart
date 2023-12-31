part of 'forgot_password_bloc.dart';

@immutable

sealed class ForgotPasswordstate {}

final class ForgotPasswordInitial extends ForgotPasswordstate {}
final class OtpSentSuccesfully extends ForgotPasswordstate {
  final String email;
  final String otp;
  OtpSentSuccesfully({required this.email, required this.otp});
}
final class EmailNotFound extends ForgotPasswordstate{
  
}