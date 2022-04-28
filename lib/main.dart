import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:relax_app/di/configure_dependecies.dart';
import 'package:relax_app/presentation/pages/app/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(const AppPage());
}
