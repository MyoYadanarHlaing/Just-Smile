import 'package:flutter/material.dart';
import 'package:just_smile/data/model/joke_response_model.dart';
import 'package:just_smile/modules/joke/providers/joke_provider.dart';
import 'package:provider/provider.dart';

import '../../injector.dart';
import 'widgets/single_joke_widget.dart';
import 'widgets/two_part_joke_widget.dart';

class JokePage extends StatelessWidget {
  final bool fromCategory;
  final String? catName;

  const JokePage({super.key, this.fromCategory = false, this.catName});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<JokeProvider>(),
      builder: (context, wd) {
        fromCategory
            ? context.read<JokeProvider>().getJokesByCategory(catName!)
            : context.read<JokeProvider>().getAllJokes();

        return Scaffold(
          appBar: fromCategory
              ? AppBar(
                  elevation: 0,
                  backgroundColor: const Color(0xFFBCA0EF),
                  iconTheme: const IconThemeData(color: Colors.white),
                  surfaceTintColor: Colors.transparent,
                )
              : null,
          body: Consumer<JokeProvider>(builder: (context, jokeProvider, wd) {
            return Container(
              padding: EdgeInsets.only(
                  left: 16, right: 16, top: fromCategory ? 0 : 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: fromCategory
                      ? const [
                          Color(0xFFBCA0EF),
                          Color(0xFF1ACCBF),
                        ]
                      : const [
                          Color(0xFFF8ED51),
                          Color(0xFFFAD4C4),
                        ],
                ),
              ),
              child: jokeProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : jokeProvider.jokes.isNotEmpty
                      ? ListView(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              fromCategory ? '${catName!} Jokes' : 'Have Fun!',
                              style: const TextStyle(
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
                        )
                      : const Center(
                          child: Text(
                            'No Joke Found.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                shadows: [
                                  Shadow(blurRadius: 5, color: Colors.black),
                                ]),
                          ),
                        ),
            );
          }),
        );
      },
    );
  }
}
