import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final String description;

  const Task({
    this.id,
    @required this.title,
    @required this.description,
  });

  Map<String, dynamic> get toMap => {
        'id': id,
        'title': title,
        'description': description,
      };
}
