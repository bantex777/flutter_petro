import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:pertroqwiq/src/features/login/features/posts/bloc/login_event.dart';
import 'package:pertroqwiq/src/features/login/features/posts/bloc/login_state.dart';
import 'package:pertroqwiq/src/features/login/model/LoginResponse.dart';

import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginBlocEvent, LogInState> {
  LoginBloc(LogInState initialState) : super(initialState) {
    on(eventHandler);
  }
}

FutureOr<void> eventHandler(
    LoginBlocEvent event, Emitter<LogInState> emit) async {
  if (event is LoginEvent) {
    await login(event.x_name, event.x_pass)
        .then((value) => emit(LogInBlocState(value)));
  }
}

Future<LoginResponse> login(String email, String password) async {
  final uri = Uri.parse("https://petroqwiq.com/posts/check_pass_member.php");
  final map = <String, dynamic>{};
  map['x_name'] = email; //"jpayabyab07@gmail.com";
  map['x_pass'] = password; //"aDeHSvpzow qweq weqweqweq weqweqwe";
  final response = await http.post(uri, body: map);
  print(jsonDecode(response.body));
  print(response.statusCode);
  List<Map<String, dynamic>> _map = [];
  _map = List<Map<String, dynamic>>.from(jsonDecode(response.body));

  print(_map[0]);

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(_map[0]);
  } else {
    throw Exception("failed");
  }
}
