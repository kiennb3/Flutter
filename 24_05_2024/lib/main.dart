
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scrollview(),
    );
  }
}
class Item {
  final String name;
  final String description;
  final double price;

  Item(this.name, this.description, this.price);
}
class Scrollview extends StatefulWidget {
  const Scrollview({super.key});

  @override
  State<Scrollview> createState() => _ScrollviewState();
}

class _ScrollviewState extends State<Scrollview> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Item> top = [];
  List<Item> bottom = [Item('Item0', 'description0', 0.2)];
 int counter=1;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press on the plus to add items above and below'),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              // top.add(-top.length - 1);
              // bottom.add(bottom.length);
              top.add(Item('Item -$counter','Description -$counter', -counter.toDouble()));
              bottom.add(Item('Item $counter', 'Description $counter', counter.toDouble()));
              counter++;
            });
          },
        ),
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  // color: Colors.blue[200 + top[index] % 4 * 100],
                    color: Colors.blue[200 +(index %4) * 100],
                  // height: 100 + top[index] % 4 * 20.0,
                    height: 100 + (index %4)* 20.0,
                    child: ListTile(
                    title: Text('Name: ${top[index].name}'),
                    subtitle: Text('Description: ${top[index].description}'),
                    trailing: Text('\$${top[index].price.toStringAsFixed(2)}'),
                ),
                );
                  },
              childCount: top.length,
            ),
          ),
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  // color: Colors.blue[200 + bottom[index] % 4 * 100],
                  color:  Colors.blue[200 + (index %4) *100],
                  // height: 100 + bottom[index] % 4 * 20.0,
                  height: 100 + (index %4) * 20.0,
                  child: ListTile(
                    title: Text('Name: ${top[index].name}'),
                    subtitle: Text('Description: ${top[index].description}'),
                    trailing: Text('\$${top[index].price.toStringAsFixed(2)}'),
                  ),
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
    );
  }
}



class Filtering extends StatefulWidget {
  const Filtering({super.key});

  @override
  State<Filtering> createState() => _FilteringState();
}

class _FilteringState extends State<Filtering> {
  List<String> names = ['Kien', 'Bob', 'Alex', 'Brian','Alice','Alian'];
  String filter = 'K';

  @override
  Widget build(BuildContext context) {
    List<String> filteredNames = names.where((name) => name.startsWith(filter)).toList();
    int count = filteredNames.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lọc Danh Sách'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Số lượng tên bắt đầu bằng chữ $filter: $count',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredNames[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}










































// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Custom Button Example'),
//         ),
//         body: Center(
//
//           child : Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomButton(text: "Click here",
//                            color: Colors.blueGrey,
//                            onPressed: (){
//                            print('Submit successfully');
//             }),
//               CustomButton(text: "Click here",
//                   color: Colors.blueGrey,
//                   onPressed: (){
//                     print('Submit successfully');
//                   }),
//
//
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }
//
// class CustomButton extends StatelessWidget {
//   final String text;
//   final Color color;
//   final VoidCallback onPressed;
//
//   CustomButton({required this.text, required this.color, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//       ),
//       child: Text(text),
//     );
//   }
// }
//
// =================================================Making Content Scrollable with SingleChildScroll View
//
//
//
