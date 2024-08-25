import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/feature/main/widgets/tab_bar_items.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onDropdownValueChanged(String? newValue, int tabIndex) {
    if (newValue != null) {
      setState(() {
        selectedValue = newValue;
        _tabController.index = tabIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.blue.shade900,
          ),
          SizedBox(height: 5),
          TabBar(
            indicatorWeight: 1,
            controller: _tabController,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.transparent;
                }
                return null;
              },
            ),
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.symmetric(horizontal: 2),
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: [
              Tab(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 90, maxWidth: 200),
                  child: DropdownMenu<String>(
                    expandedInsets: EdgeInsets.zero,
                    width: 150,
                    hintText: 'Парламент',
                    initialSelection: selectedValue,
                    onSelected: (String? newValue) {
                      _onDropdownValueChanged(newValue, 0);
                    },
                    dropdownMenuEntries: TabBarDropDownItems.parlamentDropDown
                        .map(
                          (element) => DropdownMenuEntry(
                            value: element,
                            label: element,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 90,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black45),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('Торага'),
                ),
              ),
              Tab(
                child: Container(
                  height: 90,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black45),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('Заместители Торага'),
                ),
              ),
              Tab(
                child: Container(
                  height: 90,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black45),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('Депутаты'),
                ),
              ),
              Tab(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 90, maxWidth: 200),
                  child: DropdownMenu<String>(
                    expandedInsets: EdgeInsets.zero,
                    // width: 200,
                    hintText: 'Деятельность ЖК',
                    initialSelection: selectedValue,
                    onSelected: (String? newValue) {
                      _onDropdownValueChanged(newValue, 4);
                    },
                    dropdownMenuEntries:
                        TabBarDropDownItems.deyatelnostJKDropDown
                            .map(
                              (element) => DropdownMenuEntry(
                                value: element,
                                label: element,
                              ),
                            )
                            .toList(),
                  ),
                ),
              ),
              Tab(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 90, maxWidth: 200),
                  child: DropdownMenu<String>(
                    expandedInsets: EdgeInsets.zero,
                    hintText: 'Структура ЖК',
                    initialSelection: selectedValue,
                    onSelected: (String? newValue) {
                      _onDropdownValueChanged(newValue, 5);
                    },
                    dropdownMenuEntries: TabBarDropDownItems.structuraJKDropDown
                        .map(
                          (element) => DropdownMenuEntry(
                            value: element,
                            label: element,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Tab(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 90, maxWidth: 150),
                  child: DropdownMenu<String>(
                    expandedInsets: EdgeInsets.zero,
                    width: 150,
                    hintText: 'Медиа',
                    initialSelection: selectedValue,
                    onSelected: (String? newValue) {
                      _onDropdownValueChanged(newValue, 6);
                    },
                    dropdownMenuEntries: TabBarDropDownItems.mediaDropDown
                        .map(
                          (element) => DropdownMenuEntry(
                            value: element,
                            label: element,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Center(child: Text("Car Tab")),
                Center(child: Text("Transit Tab")),
                Center(child: Text("Bike Tab")),
                Center(child: Text("Bike Tab")),
                Center(child: Text("Bike Tab")),
                Center(child: Text("Bike Tab")),
                Center(child: Text("Bike Tab")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
