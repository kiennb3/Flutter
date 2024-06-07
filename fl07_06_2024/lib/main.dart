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
      home: NavigateScreen(),
    );
  }
}
class NavigateScreen extends StatefulWidget {
  const NavigateScreen({super.key});

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  int _selectedIndex =0;
  static const List<Widget> _widgetOptions = <Widget>[
     userListScreen(),
    Center(child: Text('Home'),),
    Center(child: Text('Setting'),)
  ];
  void _onItemTap(int index){
    setState(() {
      _selectedIndex =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar (

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,

        items: <BottomNavigationBarItem>[

       BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
       BottomNavigationBarItem(icon: Icon(Icons.home),label: '') ,
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTap,

      ),

    );
  }
}


class userListScreen extends StatefulWidget {
  const userListScreen({super.key});

  @override
  State<userListScreen> createState() => _userListScreenState();
}

class _userListScreenState extends State<userListScreen> {
  final List<User> users=[
    User(name: 'kiendo', age: 20, email: 'dokien2004@gmail.com'),
    User(name: 'kiendo', age: 20, email: 'dokien2004@gmail.com'),
    User(name: 'kiendo', age: 20, email: 'dokien2004@gmail.com'),
    User(name: 'kiendo', age: 20, email: 'dokien2004@gmail.com'),
  ];
  final TextEditingController nameController=TextEditingController();
  final TextEditingController ageController=TextEditingController();
  final TextEditingController emailController=TextEditingController();

  void _deleteIcon(int index){
    setState(() {
      users.removeAt(index);

    });
  }
  void _addUser(String name,int age,String email){
    setState(() {
      users.add(User(name: name, age: age, email: email));
    });
  }
  void _updateUser(int index,String name,int age,String email){
    setState(() {
      users[index]=User(name: name, age: age, email: email);
    });
  }

  void _showUpdate(BuildContext context, int index){
    final User user = users[index];
    nameController.text =user.name;
    ageController.text=user.age.toString();
    emailController.text=user.email;

    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text('Edit user'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name'
              ),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                labelText: 'Age'
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email'
              ),
            )
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text('Cancel')
          ),
          TextButton(onPressed: () {
            final String name= nameController.text;
            final int? age=int.tryParse(ageController.text);
            final String email= emailController.text;
            if(name.isNotEmpty && age !=null && email.isNotEmpty){
              _updateUser(index, name, age, email);
              nameController.clear();
              ageController.clear();
              emailController.clear();
              Navigator.of(context).pop();
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('nhap dung dinh dang'),
                duration: Duration(seconds: 2),
                )
              );
            }
          }, child: Text('Save'))
        ],
      );
        });
  }
  void _showDelete(BuildContext context, int index){
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text('Mo delete'),
        content: Text('ban chac chan muon xoa'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel')
          ),
          TextButton(onPressed: () {
            _deleteIcon(index);
            Navigator.of(context).pop();
          }, child: Text('delete'))
        ],
      );
        });
  }
  void _showAdd(BuildContext context){
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text('Add user'),
        content: Column(

          mainAxisSize: MainAxisSize.min,
          children: [

            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(controller: ageController,
            decoration: InputDecoration(labelText: 'Age'),),
            TextField(controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),)
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text('Cancel')
          ),
          TextButton(onPressed: () {
            final String name= nameController.text;
            final int? age= int.tryParse(ageController.text);
            final String email=emailController.text;

            if(name.isNotEmpty && age !=null && email.isNotEmpty){
              _addUser(name, age, email);
              nameController.clear();
              ageController.clear();
              emailController.clear();
              Navigator.of(context).pop();
            } else{
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text('vui long nhap du thong tin'),
                 duration:  Duration(seconds: 2),)
               );
            }
          }, child: Text('Add'))
        ],
      );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showAdd(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final User user = users[index];
          return Dismissible(
            key: Key(user.name),
            background: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _deleteIcon(index);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(user.name),
                      subtitle: Text('Age: ${user.age}, Email: ${user.email}'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          _showUpdate(context, index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _showDelete(context, index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class User{
  final String name;
  final int age;
  final String email;

  User({required this.name, required this.age, required this.email});

// Phương thức để chuyển đổi từ JSON sang model
factory User.fromJson(Map<String, dynamic>json){
  return User(name: json['name'], age: json['age'], email: json['email']);
}
Map<String, dynamic> toJson(){
  return{
    'name':name, 'age':age, 'email':email
  };
}
}

