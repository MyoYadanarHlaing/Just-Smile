import 'package:flutter/material.dart';

import '../../../data/model/joke_response_model.dart';

class SingleJokeWidget extends StatelessWidget {
  const SingleJokeWidget({
    super.key,
    required this.joke,
  });

  final JokeModel joke;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          joke.joke!,
          style: const TextStyle(
            color: Colors.black,
            shadows: [
              Shadow(blurRadius: 5, color: Colors.blueGrey),
            ],
          ),
        ));
  }
}
