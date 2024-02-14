import 'package:equatable/equatable.dart';
import 'package:pertroqwiq/src/features/login/model/LoginResponse.dart';

class LogInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogInBlocInitialState extends LogInState {}

class LogInBlocLoadingState extends LogInState {}

class LogInBlocErrorState extends LogInState {}

class LogInBlocState extends LogInState {
  final LoginResponse loginResponse;
  LogInBlocState(this.loginResponse);

  @override
  List<Object?> get props => [loginResponse];
}
