import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    const messages = <String>[
      'Loading Movies',
      'Loading Categories',
      'Loading Favorites',
      'Loading Now Playing',
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Please wait'),
        const SizedBox(height: 10),
        const CircularProgressIndicator(
          strokeWidth: 6,
        ),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading ...');
            return Text(snapshot.data!);
          },
        )
      ],
    ));
  }
}
