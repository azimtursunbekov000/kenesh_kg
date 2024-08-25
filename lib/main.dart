import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/feature/app/widget/app_context.dart';

void main() {
  runApp(const KeneshKgApp());
}

class KeneshKgApp extends StatelessWidget {
  const KeneshKgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContext();
  }
}
