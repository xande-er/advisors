import 'package:advisors/components/read_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  final String? icon, error;
  final String? hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;

  const TextFieldWidget({Key? key, this.icon, required this.controller, this.error, this.onChanged, this.hintText}) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext c) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffEFEFEF).withOpacity(0.18),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
              border: Border.all(color: Colors.white.withOpacity(0.18), width: 1)),
          child: StatefulBuilder(builder: (BuildContext context, StateSetter set) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 60,
                  child: Row(
                    children: [
                      if (widget.icon != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SvgPicture.asset(
                            widget.icon!,
                            width: 25,
                          ),
                        ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: TextField(
                              textAlign: TextAlign.start,
                              onChanged: widget.onChanged,
                              controller: widget.controller,
                              decoration: InputDecoration(
                                  hintText: widget.hintText,
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.getFont('Inter',
                                      color: const Color(0xffFFFFFF).withOpacity(0.7), fontSize: 22, fontWeight: FontWeight.w400)),
                              style: GoogleFonts.getFont('Inter', fontWeight: FontWeight.w500, fontSize: 22, color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
                if (widget.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: readText(
                          text: widget.error!,
                          color: const Color(0xffEB5858),
                          fontWeight: FontWeight.w600,
                          size: 18,
                          align: TextAlign.center,
                          getFont: 'Inter'),
                    ),
                  )
              ],
            );
          })),
    );
  }
}
