import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: const Text('Vamos cozinhar!'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ), 
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        children: dummyCategorys.map((cat) {
          return CategoryItem(cat);
        }).toList(),
          
        ),
    );
  }
}