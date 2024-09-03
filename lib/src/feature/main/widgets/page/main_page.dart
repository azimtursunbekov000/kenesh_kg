import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_router/app_routes_names.dart';
import '../../../../common/common.dart';
import '../main_button_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logoWhite.png',
                    width: 300,
                    height: 400,
                  ),
                  const SizedBox(height: 50),
                  Wrap(
                    // Use Wrap instead of Row to handle overflow automatically
                    spacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      MainButtonWidget(
                        onTap: () {},
                        title: 'Парламент',
                      ),
                      MainButtonWidget(
                        onTap: () {
                          context.pushNamed(AppRoutesNames.chairmanPage);
                        },
                        title: S.of(context).chairman,
                      ),
                      MainButtonWidget(
                        onTap: () {
                          context.pushNamed(AppRoutesNames.viceChairmanPage);
                        },
                        title: S.of(context).vice_chairmen,
                      ),
                      MainButtonWidget(
                        onTap: () {
                          context.pushNamed(AppRoutesNames.deputiesPage);
                        },
                        title: 'Депутаты',
                      ),
                      MainButtonWidget(
                        onTap: () {},
                        title: 'Структура ЖК',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
