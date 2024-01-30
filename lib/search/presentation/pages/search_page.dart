import 'package:app/search/data/search_list.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(13, 32, 13, 0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.chevron_left, color: theme.colorScheme.primary),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.location_on,
                color: theme.colorScheme.primary,
              ),
              onPressed: () {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Home",
                    style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2)),
                Text("Blk 3, Lot 21, Solen Residences",
                    style: TextStyle(
                        fontSize: 12, color: theme.colorScheme.primary, letterSpacing: 0.8))
              ],
            )
          ],
        ),
        const DropdownButtonExample(),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            scrollDirection: Axis.vertical,
              children: searchList,
          ),
        ),
      ]),
    ));
  }
}

const List<String> list = <String>['Car Wash', 'Home Maintenance', 'Plumbing'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 24,
      style: const TextStyle(color: Colors.black87),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
