import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listinsidelist extends StatefulWidget {
  const Listinsidelist({super.key});

  @override
  State<Listinsidelist> createState() => _ListinsidelistState();
}

class _ListinsidelistState extends State<Listinsidelist> {

  final List<ListItem> items= List<ListItem>.generate(
    1000, (i) => i % 6 == 0
      ? HeadingItem('Heading $i')
      : MessageItem('Sender $i' ,'Message body $i')
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
        final item=items[index];

        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildSubtitle(context),
          );
         }),
     );
  }
}
abstract class ListItem{
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem{
  final String heading;

  HeadingItem(this.heading);
  @override
  Widget buildSubtitle(BuildContext context) {
   return Text(
   heading,
   style: Theme.of(context).textTheme.headlineSmall,
   );
  }

  @override
  Widget buildTitle(BuildContext context) => SizedBox.shrink();

}

class MessageItem implements ListItem{
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildSubtitle(BuildContext context) => Text(sender);

  @override
  Widget buildTitle(BuildContext context) => Text(body);


}
