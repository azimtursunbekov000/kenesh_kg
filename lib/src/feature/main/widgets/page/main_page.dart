import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kenesh_kg/src/common/app_router/app_routes_names.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo_of_the_jogorku_kenesh.svg',
                  width: 300,
                  height: 400,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButtonWidget(
                      onTap: () {},
                      title: 'Парламент',
                    ),
                    SizedBox(width: 20),
                    MainButtonWidget(
                      onTap: () {
                        context.pushNamed(AppRoutesNames.chairmanPage);
                      },
                      title: S.of(context).chairman,
                    ),
                    SizedBox(width: 20),
                    MainButtonWidget(
                      onTap: () {
                        context.pushNamed(AppRoutesNames.viceChairmanPage);
                      },
                      title: S.of(context).vice_chairmen,
                    ),
                    SizedBox(width: 20),
                    MainButtonWidget(
                      onTap: () {
                        context.pushNamed(AppRoutesNames.deputiesPage);
                      },
                      title: 'Депутаты',
                    ),
                    SizedBox(width: 20),
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
    );
  }
}
