import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/feature/deputies/model/deputies_model.dart';
import 'package:kenesh_kg/src/feature/deputies/widgets/deputies_sliver_grid.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Депутаты'),
            titleTextStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
            actions: [
              Column(
                children: [
                  Icon(Icons.list),
                  Icon(Icons.view_comfortable_rounded),
                ],
              ),
              SizedBox(width: 16),
            ],
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
                        decoration: InputDecoration(
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
                        textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            minimumSize: const Size(130, 58),
                          ),
                          child: Text(
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
          DeputiesSliverGrid(
            deputiesModel: DeputiesModel(
              id: 1,
              fullName: 'Шакиев Нурланбек Тургунбекович',
              pathToImage: 'assets/images/shakiev_image.png',
              phone: '+996777777777',
              email: 'shakiev@gamil.com',
              faction: 1,
            ),
          ),
        ],
      ),
    );
  }
}
