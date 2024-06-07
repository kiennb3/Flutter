import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

final countProvider = StateProvider<int>((ref) => 0);
class Providers extends ConsumerWidget {
  const Providers({super.key});

  @overridev
  Widget build(BuildContext context, WidgetRef  ref) {
    // 2. Truy cập Provider
    final count = ref.watch(countProvider); // Lấy giá trị hiện tại của countProvider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ví dụ Bộ đếm'), // Thay đổi tiêu đề AppBar
      ),
      body: Center(
        child: Text(
          'Giá trị: $count', // Hiển thị giá trị count
          style: const TextStyle(fontSize: 24.0), // Thêm định dạng văn bản
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tăng giá trị count
          ref.read(countProvider).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}