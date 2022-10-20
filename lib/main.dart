// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_fit_meal/screens/auth/forgot_password/forgot_passwd_page.dart';
import 'package:fit_fit_meal/screens/auth/signIn/signIn_page.dart';
import 'package:fit_fit_meal/screens/auth/signUp/signUp_page.dart';
import 'package:fit_fit_meal/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FitFitMeal());
}

class FitFitMeal extends StatefulWidget {
  const FitFitMeal({
    Key? key,
  }) : super(key: key);

  @override
  State<FitFitMeal> createState() => _FitFitMealState();
}

class _FitFitMealState extends State<FitFitMeal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        builder: (context, state) => const Home(),
        routes: <GoRoute>[
          GoRoute(
              path: "signIn", builder: (context, state) => const LoginPage()),
          GoRoute(
            path: "signUp",
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            path: "forgot_password",
            builder: (context, state) => const ForgotPasswdPage(),
          ),
        ],
      ),
    ],
  );
}
