import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_app/core/services/share_perfences.dart';
import 'package:fruit_app/features/splash_view/presentation/views/splash_view.dart';
import 'package:fruit_app/generated/l10n.dart';

import 'core/helper_functions/ongenerate_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();

  runApp(const FruitHUb());
}

class FruitHUb extends StatelessWidget {
  const FruitHUb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'cairo',
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Fruit Hub',
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
