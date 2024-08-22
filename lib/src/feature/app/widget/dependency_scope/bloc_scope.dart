import 'package:flutter/material.dart';

class BlocScope extends StatelessWidget {
  const BlocScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
    // return MultiBlocProvider(
    //   providers: [
    //
    //   ],
    //   child: child,
    // );
  }
}
