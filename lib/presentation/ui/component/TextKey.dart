import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    required this.text,
    required this.onTabText,
    required this.color,
    this.flex = 1,
  }) : super(key: key);
  final String text;
  final Function(String) onTabText;
    final int flex;
  final int color;


  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Material(
          color: Color(color),
          child: InkWell(
            onTap: () {
              onTabText(text);
              log("#### $text");
            },
            child: Container(
              child: Center(child: Text(text,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0x66000000)),)),
            ),
          ),
        ),
      ),
    );
  }
}
