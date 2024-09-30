import 'package:flutter/material.dart';
import 'package:just_smile/data/model/joke_response_model.dart';
import 'package:just_smile/modules/joke/providers/joke_provider.dart';
import 'package:provider/provider.dart';

import '../../injector.dart';
import 'widgets/single_joke_widget.dart';
import 'widgets/two_part_joke_widget.dart';

class JokePage extends StatelessWidget {
  const JokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<JokeProvider>(),
      builder: (context, wd) {
        context.read<JokeProvider>().getAllJokes();

        return Scaffold(
          body: Consumer<JokeProvider>(builder: (context, jokeProvider, wd) {
            return Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF8ED51),
                    Color(0xFFFAD4C4),
                  ],
                ),
              ),
              child: jokeProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Have Fun!',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 5,
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: jokeProvider.jokes.length,
                            itemBuilder: (context, index) {
                              JokeModel joke = jokeProvider.jokes[index];
                              return joke.type == 'single'
                                  ? SingleJokeWidget(joke: joke)
                                  : TwoPartJokeWidget(joke: joke);
                            },
                            separatorBuilder: (context, index) {
                              return Image.asset(
                                'assets/images/emoji_divider.png',
                                height: 70,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            );
          }),
        );
      },
    );
  }
}
