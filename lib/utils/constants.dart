import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xFF001140);

const Color kInitialScreenBackgroundColor = Color(0xFF1F2023);

final kFormContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(4.0),
  border: Border.all(color: const Color(0xFF2D2D2F), width: 1.6, style: BorderStyle.solid),
);

const kFormTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 18,
  color: Color(0xFF8791A7),
);

final kFormInputDecoration = InputDecoration(
  hintStyle: const TextStyle(
    color: Color(0xFF8791A7),
    fontSize: 16,
  ),
  filled: true,
  fillColor: const Color(0xFF14151A),
  focusColor: const Color(0xFF14151A),
    contentPadding: const EdgeInsets.fromLTRB(21, 19, 21, 19),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFF2D2D2F), width: 1.0, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(4.0),
  ),
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  focusedErrorBorder: InputBorder.none,
);