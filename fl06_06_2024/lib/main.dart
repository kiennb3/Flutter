import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  futureProviders(),
    );
  }
}
class providers extends ConsumerWidget{
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    
    return Scaffold(
      body: Center(
        child: Text('Counter value: $counter'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => ref.read(counterProvider.state).state++,
      child: Icon(Icons.add),),
    );
  }
}

class futureProviders extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final future =ref.read(futureProvider);

  return Scaffold(
  body: Center(
    child:  future.when(
data: (value) => Text('Value: $value'),
      loading: () => CircularProgressIndicator(),
error: (error, stack) => Text('Error: $error'),
    ),
  ),
  );
  }

}
