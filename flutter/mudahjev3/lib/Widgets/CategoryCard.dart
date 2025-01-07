import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mudahjev3/Screen/LessonScreen.dart';

final _firestore = FirebaseFirestore.instance;
class CategoryStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }

          final categories = snapshot.data?.docs;
          List<CategoryCard> categoryList = [];

          for (var category in categories!) {
            final categoryData = category.data() as Map<String, dynamic>;
            var categoryCard =
            CategoryCard(title: categoryData['title'], onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LessonScreen(
                // send data to lesson screen inside here
                category: categoryData,
              )));
            });

            categoryList.add(categoryCard);
            print(categoryData);
          }

          return Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: categoryList,
              ));
        });
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  CategoryCard({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}