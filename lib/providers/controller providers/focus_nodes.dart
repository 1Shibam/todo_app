import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firstFocusNode = AutoDisposeProvider((ref) {
  final focusNode = FocusNode();
  return focusNode;
});
final secondFocusNode = AutoDisposeProvider((ref) {
  final focusNode = FocusNode();
  return focusNode;
});
final thirdFocusNode = AutoDisposeProvider((ref) {
  final focusNode = FocusNode();
  return focusNode;
});
final fourthFocusNode = AutoDisposeProvider((ref) {
  final focusNode = FocusNode();
  return focusNode;
});
