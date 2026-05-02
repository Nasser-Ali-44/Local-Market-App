import 'package:flutter/material.dart';

void main() {
  runApp(LocalMarketApp());
}

class LocalMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Market',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login - Local Market')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.storefront, size: 100, color: Colors.blue),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home - Buy & Sell')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Local Market!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 40),
            ElevatedButton.icon(
              icon: Icon(Icons.shopping_cart),
              label: Text('Buy Items (Browse)'),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuyPage()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.add_a_photo),
              label: Text('Sell an Item (Add)'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BuyPage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "title": "Fresh Bread",
      "price": "2 SAR",
      "desc": "Freshly baked bread from the neighborhood bakery."
    },
    {
      "title": "Milk (1 Liter)",
      "price": "5 SAR",
      "desc": "Fresh full-fat milk."
    },
    {
      "title": "Local Honey",
      "price": "50 SAR",
      "desc": "Natural organic honey from a local farm."
    },
    {
      "title": "Fresh Eggs",
      "price": "15 SAR",
      "desc": "A carton of 30 fresh farm eggs."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Items')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.shopping_bag, size: 40, color: Colors.blueGrey),
              title: Text(items[index]['title']!),
              subtitle: Text(items[index]['desc']!),
              trailing: Text(
                items[index]['price']!,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Contacting the seller...')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Item'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item Title',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price (SAR)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description & Specs',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item successfully added!')),
                );
                Navigator.pop(context);
              },
              child: Text('Post Item'),
            ),
          ],
        ),
      ),
    );
  }
}
