import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_app/core/services/bloc_observer.dart';
import 'package:fruit_app/core/services/git_it_service.dart';
import 'package:fruit_app/core/services/share_perfences.dart';
import 'package:fruit_app/features/splash_view/presentation/views/splash_view.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/helper_functions/ongenerate_route.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vogvgpltvaxhkxiqsejq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZvZ3ZncGx0dmF4aGt4aXFzZWpxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk0MzI2MzEsImV4cCI6MjA4NTAwODYzMX0.1lI-Yx5BJx4NrhQR-_Aquy52k-wB9myRfs2-KfuDs0Y',
    authOptions: const FlutterAuthClientOptions(
      autoRefreshToken: true,
    ),
  );

  await Prefs.init();
  setupGetit();

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
