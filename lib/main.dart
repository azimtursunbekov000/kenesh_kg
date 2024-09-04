import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/feature/app/initialization/runner.dart';
import 'package:media_kit/media_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Necessary initialization for package:media_kit.
  MediaKit.ensureInitialized();
  runApp(const KeneshKgApp());
}

class KeneshKgApp extends StatelessWidget {
  const KeneshKgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Runner();
  }
}
