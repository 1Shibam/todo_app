import 'package:flutter/material.dart';
import 'package:todo_app/providers/provider_exports.dart';
//text editing controllers for multiple usage

final firstTextController = AutoDisposeStateProvider((ref) {
  final controller = TextEditingController();
  return controller;
});
final secondTextController = AutoDisposeStateProvider((ref) {
  final controller = TextEditingController();
  return controller.text;
});
final thirdTextController = AutoDisposeStateProvider((ref) {
  final controller = TextEditingController();
  return controller.text;
});
final fourthTextController = AutoDisposeStateProvider((ref) {
  final controller = TextEditingController();
  return controller.text;
});
