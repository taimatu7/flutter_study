import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/home_page_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // model(状態)
    final homePageState = ref.watch(homePageProvider);
    // viewmodel(状態の操作)
    final homePageNotifier = ref.watch(homePageProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      floatingActionButton: FloatingActionButton(
        onPressed: homePageNotifier.reset,
        child: const Icon(Icons.exposure_zero),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${homePageState.count}',
                style: const TextStyle(fontSize: 34)),
            const Padding(padding: EdgeInsets.all(10.0)),
            ElevatedButton(
              onPressed: homePageNotifier.increment,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
