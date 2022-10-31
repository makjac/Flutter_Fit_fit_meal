import 'package:firebase_core/firebase_core.dart';
import 'package:fit_fit_meal/bloc/auth/auth_bloc.dart';
import 'package:fit_fit_meal/firebase_options.dart';
import 'package:fit_fit_meal/screens/auth/forgot_password/forgot_passwd_page.dart';
import 'package:fit_fit_meal/screens/auth/signIn/signi_n_page.dart';
import 'package:fit_fit_meal/screens/auth/signUp/sign_up_page.dart';
import 'package:fit_fit_meal/screens/home/home_page.dart';
import 'package:fit_fit_meal/screens/home/pages/scaner_home/barcode_scaner.dart';
import 'package:fit_fit_meal/screens/home/pages/weekly_details/weekly_details.dart';
import 'package:fit_fit_meal/screens/tutorial/tutorial_page.dart';
import 'package:fit_fit_meal/screens/welcome/welcome_page.dart';
import 'package:fit_fit_meal/utils/user_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await UserSharedPreferences.init();

  await MobileAds.instance.initialize();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(CheckUser()),
        ),
      ],
      child: const FitFitMeal(),
    ),
  );
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
      theme: ThemeData(
        fontFamily: 'Rubik',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        builder: (context, state) => const WelcomePage(),
        routes: <GoRoute>[
          GoRoute(
            path: "signIn",
            builder: (context, state) => const LoginPage(),
          ),
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
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomePage(),
        routes: <GoRoute>[
          GoRoute(
            path: "weekly_details",
            builder: (context, state) => const WeeklyDetails(),
          ),
          GoRoute(
            path: "scaner",
            builder: (context, state) => const BarcodeScaner(),
          ),
        ],
      ),
      GoRoute(
        path: "/tutorial",
        builder: (context, state) => const TutorialPage(),
      ),
    ],
  );
}
