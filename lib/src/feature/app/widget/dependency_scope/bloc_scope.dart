import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kenesh_kg/src/feature/chairman/bloc/chairman_bloc.dart';
import 'package:kenesh_kg/src/feature/chairman/data/data.dart';

class BlocScope extends StatelessWidget {
  const BlocScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChairmanBloc>(
          create: (context) => ChairmanBloc(
            chairmanRepository: context.read<ChairmanRepository>(),
          )..add(const ChairmanInitEvent()),
        ),
      ],
      child: child,
    );
  }
}
