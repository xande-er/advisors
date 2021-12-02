import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bLoad({double radius = 18, Brightness brightness = Brightness.dark}) => Center(
      child: Theme(
          data: ThemeData(cupertinoOverrideTheme: CupertinoThemeData(brightness: brightness)),
          child: CupertinoActivityIndicator(radius: radius)),
    );
