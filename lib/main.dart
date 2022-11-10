import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:kafarat_plus_merchant/services/app_localizations_delegate.service.dart';
import 'package:kafarat_plus_merchant/utils/constants.dart';
import 'package:kafarat_plus_merchant/views/pages/active_tasks.dart';
import 'package:kafarat_plus_merchant/views/pages/categories/category_view_page.dart';
import 'package:kafarat_plus_merchant/views/pages/profile_page.dart';
import 'package:tecfy_basic_package/tecfy_basic_package.dart';

String appVersion = '0.0.1';

void main() async {
  await ConfigService.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const RestartWidget(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TecfyBasicApp.appGlobalkey,
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', 'SA'),
      supportedLocales: const [
        Locale('ar', 'SA'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // var lang = FoodExpressMerchantConfig.language;
        // if (FoodExpressMerchantConfig.language == '') {
        //   for (Locale supportedLocale in supportedLocales) {
        //     if (supportedLocale.languageCode == locale?.languageCode ||
        //         supportedLocale.countryCode == locale?.countryCode) {
        //       FoodExpressMerchantConfig.language = supportedLocale.languageCode;
        //       lang = supportedLocale.languageCode;
        //       return supportedLocale;
        //     }
        //   }
        // } else {
        //   var local = supportedLocales
        //       .where((element) => element.languageCode == lang)
        //       .first;
        //   return local;
        // }
      },
      title: 'Kafarat Plus (Merchant)',
      theme: ThemeData(
        fontFamily: "Baloo",
        primarySwatch: createMaterialColor(Constants.mainColor),
      ),
      home: const ActiveTasks(),
    );
  }
}

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inplace = true]) {
    final ids = Set();
    var list = inplace ? this : List<E>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}

extension MapHelpers on Map<String, String> {
  String? display() {
    // return this[FoodExpressMerchantConfig.language];
  }
}

class RestartWidget extends StatefulWidget {
  final Widget child;

  const RestartWidget(this.child, {super.key});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  State<RestartWidget> createState() => _RestartWidgetState();
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  bool isTomorrow() {
    final yesterday = DateTime.now().add(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
