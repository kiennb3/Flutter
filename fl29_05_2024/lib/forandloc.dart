import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forloc extends StatefulWidget {
  const forloc({super.key});

  @override
  State<forloc> createState() => _forlocState();
}

class Product{
  final String name;
  final double price;

  Product(this.name, this.price);


}
class _forlocState extends State<forloc> {

  final List<Product> products=[
  Product('Áo thun', 20),
    Product('Quần jeans', 40),
    Product('Giày Sneakers', 60),
    Product('Túi xách', 80),

  ];
  List<Product> fillteredProducts=[];

  @override
  void initState() {
    // TODO: implement initState
    fillteredProducts =products.where((product) => product.price >30).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Danh sách sản phẩm:',
            style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            for (var product in fillteredProducts) ProductItem(product:product),
          ],
        ),
      ),

    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.symmetric(vertical: 5),
     padding: EdgeInsets.all(10),
     decoration: BoxDecoration(
       border: Border.all(color: Colors.blueAccent),
       borderRadius: BorderRadius.circular(10)
     ),
     child: Column(

       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text('Tên sản phẩm: ${product.name}',
         style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
         ),
         SizedBox(height: 5,),
         Text('Gias: ${product.price} \$',style: TextStyle(fontSize: 14),)
       ],
     ),
   );
  }
}

