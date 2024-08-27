import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kenesh_kg/src/feature/chairman/data/data.dart';

class DataProviderScope extends StatelessWidget {
  const DataProviderScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IChairmanDataProvider>(
          create: (context) => ChairmanDataProvider(),
        ),
      ],
      child: child,
    );
  }
}
