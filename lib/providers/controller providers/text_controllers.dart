import 'package:flutter/material.dart';
import 'package:todo_app/providers/provider_exports.dart';
//text editing controllers for multiple usage

final firstTextController = AutoDisposeProvider((ref) {
  final controller = TextEditingController();
  return controller;
});
final secondTextController = AutoDisposeProvider((ref) {
  final controller = TextEditingController();
  return controller;
});
final thirdTextController = AutoDisposeProvider((ref) {
  final controller = TextEditingController();
  return controller;
});
final fourthTextController = AutoDisposeProvider((ref) {
  final controller = TextEditingController();
  return controller;
});
