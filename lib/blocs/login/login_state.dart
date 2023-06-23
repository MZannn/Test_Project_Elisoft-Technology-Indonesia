part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginPasswordIsHidden extends LoginState {
  final bool isHidden;
  LoginPasswordIsHidden({required this.isHidden});

  @override
  List<Object> get props => [isHidden];
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});

  @override
  List<Object> get props => [message];
}
