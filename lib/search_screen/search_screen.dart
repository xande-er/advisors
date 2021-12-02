import 'package:advisors/components/buttons/b_load.dart';
import 'package:advisors/components/read_text.dart';
import 'package:advisors/components/text_field/text_field.dart';
import 'package:advisors/model/model_specialization.dart';
import 'package:advisors/search_screen/components/block_specialization.dart';
import 'package:advisors/server/server.dart';
import 'package:advisors/struct/struct_specialization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/block_categories.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controllerSearch = TextEditingController();

  List<ModelSpecialization> modelSpecialization = [];

  @override
  Widget build(BuildContext c) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff00C8A4),
                Color(0xff005CB1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
                child: TextFieldWidget(
                    icon: 'picture/search.svg',
                    hintText: 'Category or question',
                    controller: controllerSearch,
                    onChanged: (val) {
                      if (val.length >= 2) {
                        setState(() => modelSpecialization = []);
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: SizedBox(
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < 10; i++) ...[
                        blockCategories(text: 'New'),
                        blockCategories(text: 'Marketing'),
                        blockCategories(text: 'UX/UI'),
                        blockCategories(text: 'Finance')
                      ]
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: modelSpecialization.isEmpty ? Server().search(c: c, query: controllerSearch.text) : null,
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                          for (final data in snapshot.data['questions']) {
                            modelSpecialization.add(structSpecialization(data: data));
                          }
                        }
                        return modelSpecialization.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                                child: ListView(
                                  padding: const EdgeInsets.only(top: 30),
                                  children: [
                                    readText(
                                        text: 'All according to your specialization',
                                        fontWeight: FontWeight.bold,
                                        size: 20,
                                        color: Colors.white),
                                    for (final i in modelSpecialization) blockSpecialization(model: i, c: c)
                                  ],
                                ))
                            : bLoad();
                      }))
            ],
          ),
        ));
  }
}
