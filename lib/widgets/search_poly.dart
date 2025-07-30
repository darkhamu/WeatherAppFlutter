import 'package:flutter/material.dart';

class SearchPoly extends StatefulWidget {
  final TextEditingController searchController;
  const SearchPoly({super.key, required this.searchController});

  @override
  State<SearchPoly> createState() => _SearchPolyState();
}

class _SearchPolyState extends State<SearchPoly> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchController,
      decoration: InputDecoration(
        label: const Text(
          'Поиск',
          style: TextStyle(color: Colors.black),
        ),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.15),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Colors.black),
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
