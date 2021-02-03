import 'package:auto_route/auto_route.dart';
import 'package:finance/application/auth/auth_bloc.dart';
import 'package:finance/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) => ExtendedNavigator.of(context).replace(Routes.homePage),
          unauthenticated: (_) => ExtendedNavigator.of(context).replace(Routes.signInPage),
        );
      },
      // displays the loading on start up
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
