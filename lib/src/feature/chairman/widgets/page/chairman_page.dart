import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart';
import 'package:kenesh_kg/src/common/app_router/app_routes_names.dart';
import 'package:kenesh_kg/src/feature/chairman/model/chairman_model.dart';

import '../../../../common/common.dart';
import '../../bloc/chairman_bloc.dart';

class ChairmanPage extends StatefulWidget {
  const ChairmanPage({super.key});

  @override
  State<ChairmanPage> createState() => _ChairmanPageState();
}

class _ChairmanPageState extends State<ChairmanPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChairmanBloc, ChairmanState>(
        builder: (context, state) {
          if (state is ChairmanLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ChairmanLoadFailure) {
            return Center(
              child: Text('Ошибка загрузки: ${state.error}'),
            );
          }

          ResponseModel responseList =
              const ResponseModel(count: 0, results: []);

          state.maybeWhen(
            initial: (responseModel) {
              responseList = responseModel;
            },
            loadInProgress: (responseModel) {
              responseList = responseModel;
            },
            loadSuccess: (responseModel) {
              responseList = responseModel;
            },
            orElse: () {},
          );

          final results = responseList.results ?? [];
          final firstChairman = results.isNotEmpty ? results[0] : null;

          return SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonSidebar(
                        text1: S.of(context).chairman,
                        text2: 'Төраганын Ишмердүүлүгү',
                        text3: 'Видео галереясы',
                        onTap1: () {},
                        onTap2: () {},
                        onTap3: () {
                          context.pushNamed(AppRoutesNames.videoGallery);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          firstChairman?.full_name ?? '',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 150),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              firstChairman?.photo ?? '',
                              width: 400,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          firstChairman?.full_name ?? '',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          firstChairman?.job_title ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 200),
                          Text(
                            removeHtmlTags(firstChairman?.biography_kg ?? ''),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  String removeHtmlTags(String html) {
    final document = parse(html);
    final parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
