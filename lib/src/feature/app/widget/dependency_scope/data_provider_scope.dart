import 'package:flutter/material.dart';

class DataProviderScope extends StatelessWidget {
  const DataProviderScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
    // return MultiRepositoryProvider(
    //   providers: [
    //
    //   ],
    //   child: child,
    // );
  }
}
