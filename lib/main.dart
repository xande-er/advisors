import 'dart:async';

import 'package:advisors/search_screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

bool startActive = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return MaterialApp(
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: ScrollConfiguration(
                  behavior: _ScrollBehaviour(),
                  child: ResponsiveWrapper.builder(child, minWidth: 500, defaultScale: true, breakpoints: [
                    const ResponsiveBreakpoint.autoScale(600, name: MOBILE),
                    const ResponsiveBreakpoint.resize(480, name: MOBILE),
                    const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                  ]),
                )),
          );
        },
        debugShowCheckedModeBanner: false,
        home: const Material(child: MyStart()));
  }
}

class MyStart extends HookWidget {
  const MyStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final future = useMemoized(() {});
    return FutureBuilder<String>(
        future: future,
        builder: (c, snapshot) {
          if (!startActive) load(c);
          startActive = true;
          return const SearchScreen();
        });
  }

  Future load(BuildContext c) async {}
}

class _ScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
