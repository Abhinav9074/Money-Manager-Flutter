import 'package:flutter/material.dart';
import 'package:money_manager/Stats/models/stat_models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeStats extends StatelessWidget {
  const IncomeStats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
          height: 750,
          child: SfCartesianChart(
            title: ChartTitle(
                text:
                    'Income stats from 27-08-23 to 27-09-23',
                textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'texgyreadventor-regular',
                    color: Colors.black,
                    fontWeight: FontWeight.w900)),
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: "Income Sources")
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: "Amount In Rupees")
            ),
            legend: Legend(isVisible: true),
            series: <ChartSeries>[
              ColumnSeries<IncomeStatModel, String>(
                name: "Income",
                  dataSource: getIncomeStats(),
                  xValueMapper: (IncomeStatModel stats, _) => stats.x,
                  yValueMapper: (IncomeStatModel stats, _) => stats.y,
                  dataLabelSettings: DataLabelSettings(isVisible: true)),
            ],
          ),
        ),
      ],
    );
  }
}
