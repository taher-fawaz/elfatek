import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elfatek/screens/main_screen/main_screen.dart';
import 'translations/codegen_loader.g.dart';

import 'routes.dart';
import 'screens/splash/splash_screen.dart';
import 'theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: buildTheme(Brightness.light),
      dark: buildTheme(Brightness.dark),
      builder: (_, theme) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: SplashScreen.routeName,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: theme,
          routes: routes,
        );
      },
    );
  }
}
