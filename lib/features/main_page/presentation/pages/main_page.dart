import 'dart:math' hide log;
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:test_case/core/core.dart';
import 'package:test_case/features/main_page/data/remote/data_sources/main_page_remote_data_source.dart';
import 'package:test_case/features/main_page/domain/entities/quote_entity.dart';
import 'package:test_case/features/main_page/domain/use_cases/main_page_use_case.dart';


@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const alpha = 0xFF000000;

  static const colorBase = 0xFFFFFF;

  int colorHex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter test'),
      ),
      body: GestureDetector(
        onTap: () => setState(() {
          colorHex = alpha +
              Random().nextInt(
                colorBase,
              );
          return;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          color: Color(colorHex),
          child: Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Hello There',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  FutureBuilder<List<QuoteEntity>>(
                    future: () async {
                      final temp = await MainPageUseCase(
                        dataSource: MainPageRemoteDataSource(
                          dio: DioClient.client,
                        ),
                      ).getQuote();

                      return temp;
                    }(),
                    builder: (context, snapshot) =>
                        snapshot.hasData && snapshot.data != null
                            ? Column(
                                children: [
                                  Text(
                                    snapshot.data!.single.content,
                                    textAlign: TextAlign.center,
                                  ),
                                  const Divider(),
                                  Text(
                                    snapshot.data!.single.author,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : const SizedBox.square(
                                dimension: 48,
                                child: CircularProgressIndicator(),
                              ),
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
