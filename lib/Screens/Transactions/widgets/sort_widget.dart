import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SortWidget extends StatefulWidget {
  const SortWidget({super.key});

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Price (Low To High)',
      'Price (High To Low)',
      'Date (Ascending)',
      'Date (Descending)'
    ];
    String dropdownValue = items[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Sort By',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'texgyreadventor-regular',
                color: Colors.black,
                fontWeight: FontWeight.w900),
          ),
        ),
        DropdownButton(
          value: dropdownValue,
          items: items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
        ),
        ElevatedButton.icon(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.sort), label: const Text('Sort'))
      ],
    );
  }
}
