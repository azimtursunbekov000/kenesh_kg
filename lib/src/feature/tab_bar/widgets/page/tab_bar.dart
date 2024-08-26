import 'package:flutter/material.dart';
import 'package:kenesh_kg/src/feature/deputies/widgets/page/deputies_page.dart';

import '../widgets.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _MainPageState();
}

class _MainPageState extends State<TabBarPage>
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
          const SizedBox(height: 5),
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
              DropdownTabItem(
                maxWidth: 200,
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
              TabBarItem(
                width: 100,
                text: 'Торага',
              ),
              TabBarItem(
                width: 200,
                text: 'Заместители Торага',
              ),
              TabBarItem(
                width: 100,
                text: 'Депутаты',
              ),
              DropdownTabItem(
                maxWidth: 200,
                hintText: 'Деятельность ЖК',
                initialSelection: selectedValue,
                onSelected: (String? newValue) {
                  _onDropdownValueChanged(newValue, 4);
                },
                dropdownMenuEntries: TabBarDropDownItems.deyatelnostJKDropDown
                    .map(
                      (element) => DropdownMenuEntry(
                        value: element,
                        label: element,
                      ),
                    )
                    .toList(),
              ),
              DropdownTabItem(
                maxWidth: 200,
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
              DropdownTabItem(
                maxWidth: 150,
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
                DeputiesPage(),
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
