import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_and_dash_apk/models/auth/auth_service.dart';
import 'package:splash_and_dash_apk/routes.dart';
import 'package:splash_and_dash_apk/screens/select_vehicle/select_vehicle_screen.dart';
import 'package:splash_and_dash_apk/screens/sign_in/sign_in_screen.dart';
import 'package:splash_and_dash_apk/size_config.dart';
import 'package:splash_and_dash_apk/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home: AuthenticationWrapper(),
        // initialRoute: SplashScreen.routeName,
        // initialRoute: AuthenticationWrapper.routeName,
        routes: routes,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      // routeName = HomeScreen.routeName;
      return SelectVehicleScreen();
    }
    // routeName = SignInScreen.routeName;
    return SignInScreen();
  }
}
