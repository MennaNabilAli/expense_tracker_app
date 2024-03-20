part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpLoadingState extends SignupState {}
class SignUpSuccessState extends SignupState {}
class SignUpErrorState extends SignupState {}