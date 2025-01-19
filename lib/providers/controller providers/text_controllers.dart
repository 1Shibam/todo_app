import 'package:flutter/material.dart';
import 'package:todo_app/providers/provider_exports.dart';
//text editing controllers for multiple usage

final firstTextController = AutoDisposeStateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  return controller;
});
final secondTextController = AutoDisposeStateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  return controller;
});
final thirdTextController = AutoDisposeStateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  return controller;
});
final fourthTextController = AutoDisposeStateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();
  return controller;
});
