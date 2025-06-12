import 'package:flutter/material.dart';

Widget buttonSearch() {
  return SizedBox(
    width: 300,
    height: 40,

    child: TextFormField(
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(151, 255, 160, 192),
        filled: true,
        prefixIcon: Icon(Icons.search, color: Colors.black),
        label: Text('Search'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
