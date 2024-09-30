import 'package:flutter/material.dart';

import '../../../data/model/joke_response_model.dart';

class TwoPartJokeWidget extends StatelessWidget {
  const TwoPartJokeWidget({
    super.key,
    required this.joke,
  });

  final JokeModel joke;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            joke.setup!,
            style: const TextStyle(
                color: Colors.deepOrange,
                shadows: [Shadow(blurRadius: 2, color: Colors.black)]),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              joke.delivery!,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Colors.green,
                  // fontWeight: FontWeight.w700,
                  shadows: [Shadow(blurRadius: 2, color: Colors.black)]),
            ),
          ),
        ],
      ),
    );
  }
}
