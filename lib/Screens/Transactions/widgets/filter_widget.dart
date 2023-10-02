import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';

class FilterWidget extends StatefulWidget {
  final int index;

  FilterWidget({super.key, required this.index});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  DateTime? startDate;
  // ignore: non_constant_identifier_names
  DateTime? EndDate;
  late final first_index;
  late final indexValue;

  @override
  void initState() {
    first_index = TransactionDb().allTransactionsList.value.length - 1;
    indexValue = TransactionDb().allTransactionsList.value[first_index];
    print(indexValue.date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = ['select', 'Food', 'Travel', 'Miscellaneous', 'Fees'];
    String dropdownValue = items[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Filter By Date',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: 'texgyreadventor-regular',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () async {
                  startDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: indexValue.date,
                      lastDate: DateTime.now());
                  setState(() {});
                },
                icon: const FaIcon(FontAwesomeIcons.calendar),
                label: startDate == null
                    ? const Text('Pick Start Date')
                    : Text(startDate.toString().substring(0, 10))),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'To',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: 'texgyreadventor-regular',
                ),
              ),
            ),
            TextButton.icon(
                onPressed: () async {
                  EndDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: indexValue.date,
                      lastDate: DateTime.now());
                  setState(() {});
                },
                icon: const FaIcon(FontAwesomeIcons.calendar),
                label: EndDate == null
                    ? const Text('Pick End Date')
                    : Text(EndDate.toString().substring(0, 10)))
          ],
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            'Filter By Category',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              fontFamily: 'texgyreadventor-regular',
            ),
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
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  if (startDate != null && EndDate != null) {
                    await FilterPress();
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Filter')),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Clear')),
          ],
        )
      ],
    );
  }


  Future<void> FilterPress() async {
    
    TransactionDb().FilterByDate(startDate!, EndDate!);
  }
}
