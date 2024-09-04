import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/feature/app/initialization/runner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KeneshKgApp());
}

class KeneshKgApp extends StatelessWidget {
  const KeneshKgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Runner();
  }
}
