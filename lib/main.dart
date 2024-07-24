import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:gsm_inside_flutter/router.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  isWeb(MaterialApp materialApp) {
    if (kIsWeb) {
      return Container(
        decoration: const BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(
              color: Color.fromARGB(43, 214, 214, 214),
              width: 2,
            ),
          ),
        ),
        child: materialApp,
      );
    } else {
      return materialApp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      backgroundColor: Colors.white,
      enabled: kIsWeb,
      maximumSize: const Size(600, 812),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => isWeb(
        MaterialApp.router(
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'GSM-Inside',
          routerConfig: PageRouter.router,
        ),
      ),
    );
  }
}
