import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_count/notifier/counter.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: Row(
        //Row untuk horizontal dan Column untuk vertikal
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                }),
          ),
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              }),
        ],
      ),
      appBar: AppBar(
        title: Center(
          child: Text('Los Santos Count'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Jumlah Hitungan :',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Text(
            '${ref.watch(counterProvider)}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
