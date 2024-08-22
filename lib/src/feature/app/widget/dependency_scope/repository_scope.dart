import 'package:flutter/material.dart';

class RepositoryScope extends StatelessWidget {
  const RepositoryScope({required this.child, super.key});

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
