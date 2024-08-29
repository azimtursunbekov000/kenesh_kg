import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kenesh_kg/src/feature/chairman/data/data.dart';
import 'package:kenesh_kg/src/feature/deputies/data/data.dart';
import 'package:kenesh_kg/src/feature/vice_chairman/widgets/data/data.dart';

class RepositoryScope extends StatelessWidget {
  const RepositoryScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ChairmanRepository>(
          create: (context) => ChairmanRepository(
            chairmanDataProvider: context.read<IChairmanDataProvider>(),
          ),
        ),
        RepositoryProvider<ViceChairmanRepository>(
          create: (context) => ViceChairmanRepository(
            viceChairmanDataProvider: context.read<IViceChairmanDataProvider>(),
          ),
        ),
        RepositoryProvider<DeputiesRepository>(
          create: (context) => DeputiesRepository(
            viceChairmanDataProvider: context.read<IDeputiesDataProvider>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
