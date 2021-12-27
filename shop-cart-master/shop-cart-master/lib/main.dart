import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shopcart/Auth/login_navigator.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Routes/routes.dart';
import 'package:shopcart/Theme/Provider/theme_provider.dart';
//import 'package:shopcart/Theme/style.dart';
import 'package:shopcart/language_cubit.dart';
import 'package:shopcart/map_utils.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MapUtils.getMarkerPic();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(Phoenix(child: MyApp()));
  MobileAds.instance.initialize();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit(),
            child: BlocBuilder<LanguageCubit, Locale>(
              builder: (_, locale) {
                return MaterialApp(
                  themeMode: themeProvider.themeMode,
                  theme: MyThemes.lightTheme,
                  darkTheme: MyThemes.darkTheme,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: [
                    const AppLocalizationsDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: [
                    const Locale('ar'),
                    const Locale('en'),
                    const Locale('pt'),
                    const Locale('fr'),
                    const Locale('id'),
                    const Locale('es'),
                  ],
                  locale: locale,
                  //theme: appTheme,
                  home: SignInNavigator(),
                  routes: PageRoutes().routes(),
                );
              },
            ),
          );
        });
  }
}
