import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:uuid/uuid.dart';

class Expense{
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final String imageUrl;

  Expense({
    String? id,
    required this.name,
    required this.amount,
    required this.date,
    required this.imageUrl
}) :id =id ?? Uuid().v4();
}


class Datamodel extends StatefulWidget {
  const Datamodel({super.key});

  @override
  State<Datamodel> createState() => _DatamodelState();
}

class _DatamodelState extends State<Datamodel> {

  final List<Expense> _expenses=[
    Expense(name: 'Coffe', amount: 3.50, date: DateTime.now(),imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/04/5c/aa/coffee-art.jpg'),
    Expense(name: 'Book', amount: 13.50, date: DateTime.now(),imageUrl: 'https://product.hstatic.net/1000237375/product/anh_bia-01_9b2a0845bbfe4236a21ef8578e4ab515_master.jpg'),
    Expense(name: 'Lunch', amount: 23.50, date: DateTime.now(),imageUrl: 'https://devo.vn/wp-content/uploads/2023/01/meo-cam-dao.jpg'),
    Expense(name: 'Anime', amount: 33.50, date: DateTime.now(),imageUrl: 'https://devo.vn/wp-content/uploads/2023/01/meo-cam-dao.jpg'),
    Expense(name: 'Coffe', amount: 3.50, date: DateTime.now(),imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/04/5c/aa/coffee-art.jpg'),
    Expense(name: 'Book', amount: 13.50, date: DateTime.now(),imageUrl: 'https://product.hstatic.net/1000237375/product/anh_bia-01_9b2a0845bbfe4236a21ef8578e4ab515_master.jpg'),
    Expense(name: 'Lunch', amount: 23.50, date: DateTime.now(),imageUrl: 'https://devo.vn/wp-content/uploads/2023/01/meo-cam-dao.jpg'),
    Expense(name: 'Anime', amount: 33.50, date: DateTime.now(),imageUrl: 'https://devo.vn/wp-content/uploads/2023/01/meo-cam-dao.jpg'),
    Expense(name: 'Coffe', amount: 3.50, date: DateTime.now(),imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/04/5c/aa/coffee-art.jpg'),
    Expense(name: 'Book', amount: 13.50, date: DateTime.now(),imageUrl: 'https://product.hstatic.net/1000237375/product/anh_bia-01_9b2a0845bbfe4236a21ef8578e4ab515_master.jpg'),
    Expense(name: 'Lunch', amount: 23.50, date: DateTime.now(),imageUrl: 'https://devo.vn/wp-content/uploads/2023/01/meo-cam-dao.jpg'),
    Expense(name: 'Anime', amount: 33.50, date: DateTime.now(),imageUrl: 'https://devo.vn/wp-content/uploads/2023/01/meo-cam-dao.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Expense List'),
      ),
      child: SafeArea( // Widget này đảm bảo rằng giao diện sẽ không bị che khuất bởi
        // các phần tử hệ thống như tai thỏ hoặc thanh điều hướng.

        child: ListView.builder(
            itemCount: _expenses.length,
            itemBuilder: (context,index){
              final expense=_expenses[index];
              return Padding(
                  padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.deepOrangeAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                 border: Border.all(
                   color: Colors.black.withOpacity(0.5),
                   width: 1.0
                 )
                ),
                child: CupertinoListTile(

                  title: Text(expense.name),
                  subtitle: Text('Amount: \$${expense.amount}'),
                  trailing: Text( style: const TextStyle(fontSize: 14,color: Colors.black,decoration:  TextDecoration.none),
                    '${expense.date.month}/${expense.date.day}/${expense.date.year}',
                  ),
                  leading: Image.network(
                    expense.imageUrl,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              );
        }),
      ),

    );
  }
}
// Widget tùy chỉnh để hiển thị mỗi mục chi phí

class CupertinoListTitle extends StatelessWidget {
 final Widget title;
 final Widget subtitle;
 final Widget trailing;
 final Widget leading;

  const CupertinoListTitle({super.key, required this.title, required this.subtitle, required this.trailing, required this.leading});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            subtitle,
          ],
        ),
        trailing,
        leading,
      ],
    );
  }
}

