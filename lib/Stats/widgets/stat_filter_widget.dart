import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatFilterWidget extends StatefulWidget {
  const StatFilterWidget({super.key});

  @override
  State<StatFilterWidget> createState() => _StatFilterWidgetState();
}

class _StatFilterWidgetState extends State<StatFilterWidget> {
    DateTime? startDate;
  DateTime? EndDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
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
                      firstDate: DateTime.now().subtract(Duration(days: 30)),
                      lastDate: DateTime.now());
                  setState(() {});
                },
                icon: FaIcon(FontAwesomeIcons.calendar),
                label: startDate == null
                    ? Text('Pick Start Date')
                    : Text('${startDate.toString().substring(0, 10)}')),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                      firstDate: DateTime.now().subtract(Duration(days: 30)),
                      lastDate: DateTime.now());
                  setState(() {});
                },
                icon: FaIcon(FontAwesomeIcons.calendar),
                label: EndDate == null
                    ? Text('Pick End Date')
                    : Text('${EndDate.toString().substring(0, 10)}'))
          ],
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Filter')),
            SizedBox(width: 10,),
            ElevatedButton(onPressed: (){}, child: Text('Clear')),
          ],
        )
      ],
    );
  }
}