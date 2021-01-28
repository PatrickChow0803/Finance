import 'package:auto_route/auto_route.dart';
import 'package:finance/application/auth/auth_bloc.dart';
import 'package:finance/injection.dart';
import 'package:finance/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            // initializes the auth check with the add
            create: (context) => getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()))
      ],
      child: MaterialApp(
        title: 'Notes',
        debugShowCheckedModeBanner: false,
        // home: SignInPage(),
        // overrides the default navigator with the ExtendedNavigator
        builder: ExtendedNavigator(
          router: AutoRoute(),
        ),
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.teal[800],
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(backgroundColor: Colors.white70),
            // this creates the border around TextInputFields. Ex: The email and password
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)))),
      ),
    );
  }
}
