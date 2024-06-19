import 'package:day19_06/Location.dart';
import 'package:day19_06/imagePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'places_provider.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: Imagepickers(),
    );
  }
}
class Place{
  final String id;
  final String title;
  final String description;

  Place({required this.id, required this.title, required this.description});
  
}
class PlacesScreen extends ConsumerWidget{
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final places=ref.watch(placesProvider);
   
   return Scaffold(
     appBar: AppBar(
       title: Text('Địa điểm'),
     ),
     body: ListView.builder(
         itemCount: places.length,
         itemBuilder: (context, index) {
           return ListTile(
     title: Text(places[index].title),
     subtitle: Text(places[index].description),

           );
         },
     ),
     floatingActionButton: FloatingActionButton(onPressed: () {
       showDialog(
         context: context,
         builder: (BuildContext context) {
         return AddPlaceDialog (
           onAddPlace:(Place place){
             ref.read(placesProvider.notifier).addPlace(place);
           }
         );
         },
       );
     },
     child: Icon(Icons.add),
     ),
   );
  }
  
}

class AddPlaceDialog extends StatefulWidget {
 final void Function(Place place) onAddPlace;

  const AddPlaceDialog({super.key, required this.onAddPlace});
  @override
  State<AddPlaceDialog> createState() => _AddPlaceDialogState();
}

class _AddPlaceDialogState extends State<AddPlaceDialog> {
  final _formkey=GlobalKey<FormState>();
  String _title='';
  String _description='';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thêm địa điểm mới'),
    content: Form(
      key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                labelText: 'Tiêu đề',
              ),
              validator: (value) {
                if(value ==null||value.isEmpty){
                  return 'Vui lòng nhập tiêu đề';
                }return null;
              },
              onSaved: (newValue) {
                _title=newValue!;
              },
            ),SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                labelText: 'Mô tả',
              ),
              validator: (value) {
                if(value ==null || value.isEmpty){
                  return 'Vui lòng nhập mô tả';
                }return null;
              },
              onSaved: (newValue) {
                _description=newValue!;
              },
            )
          ],
        ),
    ),
     actions: [
       TextButton(onPressed: () {
         Navigator.of(context).pop();
       }, child: Text('Hủy')
       ),
       TextButton(onPressed: () {
         if(_formkey.currentState!.validate()){
           _formkey.currentState!.save();
           final newPlace=Place(id: DateTime.now().toString(),
               title: _title,
               description: _description
           );
           widget.onAddPlace(newPlace);
           Navigator.of(context).pop();
         }
       }, child: Text('Thêm'))
     ],

    );

  }
}

