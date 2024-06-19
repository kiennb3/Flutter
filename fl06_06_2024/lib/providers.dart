import 'package:flutter_riverpod/flutter_riverpod.dart';

// Ví dụ về một StateProvider
final counterProvider = StateProvider<int>((ref) {
  return 0;
});
// StateProvider cho một chuỗi
final messageProvider = StateProvider<String>((ref) {
  return "Hello, Riverpod!";
});

final streamProvider = StreamProvider<int>((ref) async* {
  yield* Stream.periodic(Duration(seconds: 1), (count) => count);
});
final futureProvider = FutureProvider<int>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 42;
});

