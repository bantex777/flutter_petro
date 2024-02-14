import 'package:equatable/equatable.dart';

class LoginBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends LoginBlocEvent {
  final String x_name;
  final String x_pass;

  LoginEvent({required this.x_name, required this.x_pass});

  @override
  List<Object?> get props => [x_name, x_pass];
}
