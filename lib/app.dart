import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perpustakaan_bnsp/admin/admin.dart';
import 'package:perpustakaan_bnsp/login/login.dart';

import 'authentication/authentication.dart';
import 'member/member.dart';
import 'splash.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headline3: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          button: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
          bodyText1: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        canvasColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.adminAuthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  AdminPage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.memberAuthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  MemberPage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
