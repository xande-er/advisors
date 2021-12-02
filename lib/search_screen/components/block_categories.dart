import 'package:advisors/components/buttons/b_transparent_scalable_button.dart';
import 'package:advisors/components/read_text.dart';
import 'package:flutter/material.dart';

Widget blockCategories({required text}) => BTransparentScalableButton(
      onPressed: () {},
      scale: ScaleFormat.big,
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff15BFAD).withOpacity(0.1),
              border: Border.all(width: 1, color: Colors.white.withOpacity(0.4)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffEFEFEF).withOpacity(0.18),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: readText(text: text, color: Colors.white),
            ))),
      ),
    );
