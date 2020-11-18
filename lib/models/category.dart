import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;  // Color Type is provided by dart

  // making the const category cannot be changed once the data is set
  const Category({
    @required this.id, 
    @required this.title, 
    this.color = Colors.orange, // setting default color of orange
  }); 
}