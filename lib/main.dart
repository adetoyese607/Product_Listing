import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'product.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[850],
        title: Text(
          item.name,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
      padding: const EdgeInsets.all(2),    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/${item.image}',
              // width: 400
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ScopedModel<Product>(
                  model: item,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.description,
                      ),
                      // ignore: prefer_interpolation_to_compose_strings
                      Text('Price:' + item.price.toString()),
                      ScopedModelDescendant<Product>(
                          builder: (context, child, item) {
                        return RatingBox(item: item);
                      })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: const Text(
            'Product Listing',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ProductBox(item: items[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage(item: items[index]))
                  );
                },
              );
            }));
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    double ssize = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              item.updateRating(1);
            },
            icon: (item.rating >= 1
                ? Icon(
                    Icons.star,
                    size: ssize,
                  )
                : Icon(
                    Icons.star_border,
                    size: ssize,
                  )),
            color: Colors.red[500],
            iconSize: ssize,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              item.updateRating(2);
            },
            icon: (item.rating >= 2
                ? Icon(
                    Icons.star,
                    size: ssize,
                  )
                : Icon(
                    Icons.star_border,
                    size: ssize,
                  )),
            color: Colors.red[500],
            iconSize: ssize,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              item.updateRating(3);
            },
            icon: (item.rating >= 3
                ? Icon(
                    Icons.star,
                    size: ssize,
                  )
                : Icon(
                    Icons.star_border,
                    size: ssize,
                  )),
            color: Colors.red[500],
            iconSize: ssize,
          ),
        ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 200,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/${item.image}',
              width: 150,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ScopedModel<Product>(
                  model: item,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.description,
                      ),
                      // ignore: prefer_interpolation_to_compose_strings
                      Text('Price:' + item.price.toString()),
                      ScopedModelDescendant<Product>(
                          builder: (context, child, item) {
                        return RatingBox(item: item);
                      })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
