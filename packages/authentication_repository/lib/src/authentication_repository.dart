import 'dart:async';

import './models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:service_provider/service_provider.dart';

enum AuthenticationStatus {
  unknown,
  memberAuthenticated,
  adminAuthenticated,
  unauthenticated,
}

class AuthenticationSession extends Equatable {
  final AuthenticationStatus status;
  final User user;

  const AuthenticationSession({
    required this.status,
    required this.user,
  });

  AuthenticationSession copyWith({
    AuthenticationStatus? status,
    User? user,
  }) {
    return AuthenticationSession(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, user];
}

class AuthenticationRepository {
  final _authStreamController = StreamController<AuthenticationSession>();

  final ServiceProvider _serviceProvider = ServiceProvider();

  Stream<AuthenticationSession> get session async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationSession(
        status: AuthenticationStatus.unauthenticated, user: User.empty);
    yield* _authStreamController.stream;
  }

  Future<User?> getCurrentUser({
    required String email,
    required String password,
  }) async {
    final userData =
        await _serviceProvider.login(email: email, password: password);
    final user = User.fromJson(userData);
    return user;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    final user = await getCurrentUser(email: email, password: password);
    if (user != null) {
      await Future.delayed(
        const Duration(milliseconds: 300),
        () => _authStreamController.add(AuthenticationSession(
          status: AuthenticationStatus.memberAuthenticated,
          user: user,
        )),
      );
    } else {
      await Future.delayed(
        const Duration(milliseconds: 300),
        () => _authStreamController.add(AuthenticationSession(
            status: AuthenticationStatus.unknown, user: User.empty)),
      );
    }
  }

  void logOut() {
    _authStreamController.add(AuthenticationSession(
        status: AuthenticationStatus.unauthenticated, user: User.empty));
  }

  void dispose() => _authStreamController.close();
}
