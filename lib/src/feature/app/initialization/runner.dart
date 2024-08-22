import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/widget.dart';

class Runner extends StatefulWidget {
  const Runner({super.key});

  @override
  State<Runner> createState() => _RunnerState();
}

class _RunnerState extends State<Runner> {
  late Future<SharedPreferences> _sharedPreferences;

  @override
  void initState() {
    super.initState();
    _sharedPreferences = SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: _sharedPreferences,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final sharedPreferences = snapshot.data!;
          return CoreDependenciesScope(
            sharedPreferences: sharedPreferences,
            child: const DataProviderScope(
              child: RepositoryScope(
                child: BlocScope(
                  child: AppContext(),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}
