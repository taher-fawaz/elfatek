import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elfatek/features/auth/providers/user_provider.dart';
import 'features/auth/providers/auth_provider.dart';
import 'presentation/resources/size_config.dart';
import 'presentation/resources/routes_manager.dart';
import 'presentation/resources/theme_manager.dart';
import 'presentation/resources/translations/codegen_loader.g.dart';

import 'package:provider/provider.dart';

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
      light: getApplicationTheme(Brightness.light),
      dark: getApplicationTheme(Brightness.dark),
      builder: (_, theme) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => AuthProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => UserProvider(),
              )
            ],
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.splashRoute,
              // title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: theme,
              // routes: routes,
            ));
      },
    );
  }
}
