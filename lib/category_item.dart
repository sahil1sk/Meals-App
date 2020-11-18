import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget { 
  final String title;
  final Color color; // Color type is built in flutter not in dart

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient( // setting linear gradient effect
          colors: [
            color.withOpacity(0.7), // little transparent
            color,                  // normal color which we pass
          ],
          begin: Alignment.topLeft, // gradient start from top left corner
          end: Alignment.bottomRight, // gradient end at bottom right corner
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}