import 'package:client_app/features/splash/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '../core/common/config/app_theme.dart';
import '../core/common/injection/injection.dart';
import '../core/common/lang/app_localization.dart';
import '../core/common/local_storage/hive_services.dart';
import '../core/common/routes/app_routes.dart';
import 'home/data/model/params/change_fcm_token_params.dart';
import 'home/presentation/bloc/home_bloc.dart';
import 'home/presentation/state/home_provider.dart';
final navigatorKey=GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => HomeProvider(),
          ),
        ],
      child: MaterialApp(
          navigatorKey: navigatorKey,
          routes: Routes.routes,
          locale: Locale('ar'),
          supportedLocales: const [
            Locale('ar'), //English
            Locale('en'), //Arabic
          ],
          localizationsDelegates: [
            AppLocalizations.delegates,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // other MaterialApp configurations...
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightThemeData,
          home: SplashScreen()
      ),
    );
  }
}
