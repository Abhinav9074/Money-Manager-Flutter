import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Screens/stats/models/stat_models.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';

class StatFilterWidget extends StatefulWidget {
  StatFilterWidget({
    super.key,
  });

  @override
  State<StatFilterWidget> createState() => _StatFilterWidgetState();
}

class _StatFilterWidgetState extends State<StatFilterWidget> {
  DateTime? startDate;
  DateTime? EndDate;
  late final first_index;
  late final indexValue;

  @override
  void initState() {
    if (TransactionDb().allTransactionsList.value.isNotEmpty) {
      first_index = TransactionDb().allTransactionsList.value.length - 1;
      indexValue = TransactionDb().allTransactionsList.value[first_index];
      print(indexValue.date);
    } else {
      indexValue = null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      firstDate: TransactionDb().indexValue == null
                          ? DateTime.now()
                          : TransactionDb().indexValue.date,
                      lastDate: DateTime.now());
                  setState(() {
                    
                  });
                },
                icon: const FaIcon(FontAwesomeIcons.calendar),
                label: startDate == null
                    ? Text(
                        'Pick Date')
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
                      firstDate:
                          startDate == null ? DateTime.now() : startDate!,
                      lastDate: DateTime.now());
                  setState(() {
                   
                  });
                },
                icon: const FaIcon(FontAwesomeIcons.calendar),
                label: EndDate == null
                    ? Text(
                        'Date')
                    : Text(EndDate.toString().substring(0, 10)))
          ],
        ),
        
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await FilterPress();
                  Navigator.of(context).pop();
                },
                child: const Text('Filter')),
                
            const SizedBox(
              width: 10,
            ),
          ],
        )
      ],
    );
  }

  Future<void> FilterPress() async {
    if (startDate != null && EndDate !=null) {
      await TransactionDb().FilterByDate(startDate!, EndDate!);
      getIncomeChartData();
      getExpenseChartData();
    } 
  }
}
