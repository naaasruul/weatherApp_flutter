import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Controller for the search field
  final TextEditingController _searchController = TextEditingController();

  // Initial list of available items for searching
  List<String> allItems = [
    'mak kau',
    'mak kek',
    'tak kaw',
    'suka hati',
    'mak bau',
  ];

  // List to store the search results
  List<String> _searchResults = [];

  // List to store selected items (that will show as chips)
  List<String> selectedItems = [];

  // Simulate a search operation (filtering based on query)
  void _performSearch(String query) {
    setState(() {
      // Filter search results based on query
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults = allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // Function to add a chip to the selected items list
  void _addToSelected(String item) {
    setState(() {
      selectedItems.add(item);
    });
  }

  // Function to remove a chip from the selected items list
  void _removeFromSelected(String item) {
    setState(() {
      selectedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search TextField
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                _performSearch(query); // Perform the search
              },
            ),
            const SizedBox(height: 20),

            // Display selected chips
            Wrap(
              spacing: 8.0,
              children: selectedItems
                  .map(
                    (item) => Chip(
                  label: Text(item),
                  onDeleted: () => _removeFromSelected(item),
                ),
              )
                  .toList(),
            ),
            const SizedBox(height: 20),

            // Display search results
            _searchResults.isEmpty
                ? const Center(child: Text('No results found'))
                : Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final item = _searchResults[index];
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      // Add the tapped item to the selected chips list
                      if (!selectedItems.contains(item)) {
                        _addToSelected(item);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
