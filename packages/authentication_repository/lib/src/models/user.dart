import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int user_id;
  final String username;
  final String email;
  final String role;

  const User({
    required this.user_id,
    required this.username,
    required this.email,
    required this.role,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        user_id: json['user_id'],
        username: json['username'],
        email: json['email'],
        role: json['role'],
      );

  static const empty = User(
    user_id: 99,
    username: "-",
    email: "-",
    role: "-",
  );

  @override
  List<Object?> get props => [
        user_id,
        username,
        email,
        role,
      ];
}
