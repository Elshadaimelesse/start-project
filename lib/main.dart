// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Item_provider.dart';
import 'Items_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Items(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ItemListScreen(),
      ),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 19.0,
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.data_object),
              onPressed: () {},
            ),
            SizedBox(width: 30),
            Container(
              child: Text("List of items"),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/image/a.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Center(
                    child: Text(
                      'Elshadai Melesse',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'elshadaimelesse@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                ),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                leading: Icon(
                  Icons.data_object,
                ),
                title: const Text('items'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: const Text('setting'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                ),
                title: const Text('Account'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(179, 221, 216, 216), width: 0.5)),
              leading: Container(
                width: 68,
                height: 158,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Image.network(items[index].imageUrl),
              ),
              title: Text(items[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle:
                  Text('Price: \$${items[index].price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailScreen(item: items[index]),
                  ),
                );
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Handle add button pressed
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  ItemDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(item.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item.description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
