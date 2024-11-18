part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgetPasswordRequired extends ForgetPasswordEvent {
  final String email;

  const ForgetPasswordRequired(this.email);
}


