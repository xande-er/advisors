import 'package:advisors/components/buttons/b_transparent_scalable_button.dart';
import 'package:advisors/components/read_text.dart';
import 'package:advisors/model/model_specialization.dart';
import 'package:advisors/search_screen/components/block_categories.dart';
import 'package:flutter/material.dart';

Widget blockSpecialization({required ModelSpecialization model, required BuildContext c}) => Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white.withOpacity(0.2),
            border: Border.all(width: 0.5, color: Colors.white.withOpacity(0.4)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                readText(text: model.title!, fontWeight: FontWeight.bold, size: 30, color: Colors.white, getFont: 'Prompt'),
                if (model.tagsList != null && model.tagsList!.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (final i in model.tagsList!) ...[
                            blockCategories(text: i),
                          ],
                        ],
                      ),
                    ),
                  )
                ],
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: readText(
                      text: 'Tomorrow I have an exam on programming and I need to learn what is blockchain ASAP. I just can’t understand',
                      fontWeight: FontWeight.w400,
                      size: 20,
                      color: Colors.white),
                ),
                BTransparentScalableButton(
                  onPressed: () {},
                  scale: ScaleFormat.small,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(c).size.width - 100,
                          height: 60,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 6,
                              offset: const Offset(0, -2), // changes position of shadow
                            ),
                          ]),
                          child: Center(
                              child: readText(text: 'Show all', fontWeight: FontWeight.bold, size: 26, color: const Color(0xff363E59)))),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
