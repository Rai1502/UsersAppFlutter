import 'package:flutter/material.dart';
import 'package:users_app_flutter/presentation/login/pages/login_provider.dart';
import 'package:users_app_flutter/presentation/style/text_theme.dart';
import 'package:users_app_flutter/services/firebase_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.initializeFirebase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: theme,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: navigatorKey,
        title: 'Users App',
        home: const LoginProvider());
  }
}
