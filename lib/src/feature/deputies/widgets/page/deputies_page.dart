import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/deputies_bloc.dart';
import '../deputies_sliver_grid.dart'; // Импортируйте ваш Bloc

class DeputiesPage extends StatefulWidget {
  const DeputiesPage({super.key});

  @override
  State<DeputiesPage> createState() => _DeputiesPageState();
}

class _DeputiesPageState extends State<DeputiesPage> {
  TextEditingController nameDeputyController = TextEditingController();
  String? selectedValue;
  List<String> committeesList = [
    'Комитет по топливно-энергетическому комплексу, недропользованию и промышленной политике',
  ];
  List<String> factionsList = [
    'Парламентская фракция Ынтымак',
  ];

  @override
  void initState() {
    super.initState();
    context
        .read<DeputiesBloc>()
        .add(const DeputiesEvent.init()); // Инициализируем Bloc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                title: Text('Депутаты'),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 60,
                          child: TextFormField(
                            controller: nameDeputyController,
                            decoration: const InputDecoration(
                              labelText: 'Поиск депутатов',
                              labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 250,
                            maxHeight: 60,
                          ),
                          child: DropdownMenu<String>(
                            enableSearch: false,
                            expandedInsets: EdgeInsets.zero,
                            hintText: 'Комитеты',
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            initialSelection: selectedValue,
                            onSelected: (value) {},
                            dropdownMenuEntries: committeesList
                                .map(
                                  (element) => DropdownMenuEntry(
                                    value: element,
                                    label: element,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 250,
                                maxHeight: 60,
                              ),
                              child: DropdownMenu<String>(
                                enableSearch: false,
                                expandedInsets: EdgeInsets.zero,
                                hintText: 'Фракции',
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                initialSelection: selectedValue,
                                onSelected: (value) {},
                                dropdownMenuEntries: factionsList
                                    .map(
                                      (element) => DropdownMenuEntry(
                                        value: element,
                                        label: element,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade900,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                minimumSize: const Size(130, 58),
                              ),
                              child: const Text(
                                'Очистить',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<DeputiesBloc, DeputiesState>(
                builder: (context, state) {
                  if (state is DeputiesLoadInProgress) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is DeputiesLoadFailure) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text('Ошибка загрузки: ${state.error}'),
                      ),
                    );
                  } else if (state is DeputiesLoadSuccess) {
                    return DeputiesSliverGrid(
                      deputiesModels: state.responseModel.results ?? [],
                    );
                  } else {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text('Нет данных для отображения'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    context.push('/');
                  },
                  child: const Icon(
                    Icons.home_filled,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
