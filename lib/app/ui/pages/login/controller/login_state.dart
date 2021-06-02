import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email, password;
  final bool fetching;

  LoginState({
    required this.email,
    required this.password,
    required this.fetching,
  });

  static LoginState get initialState => LoginState(
        email: '',
        password: '',
        fetching: false,
      );

  LoginState copyWith({
    String? email,
    String? password,
    bool? fetching,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      fetching: fetching ?? this.fetching,
    );
  }

  @override
  List<Object?> get props => [email, password, fetching];
}
