import 'package:flutter/material.dart';
import 'package:money_manager/Screens/Stats/models/stat_models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseStats extends StatelessWidget {
  const ExpenseStats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 750,
          child: SfCartesianChart(
            title: ChartTitle(
                text: 'Expense stats from 27-08-23 to 27-09-23',
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'texgyreadventor-regular',
                    color: Colors.black,
                    fontWeight: FontWeight.w900)),
            primaryXAxis: CategoryAxis(title: AxisTitle(text: "Expenses")),
            primaryYAxis:
                NumericAxis(title: AxisTitle(text: "Amount In Rupees")),
            legend: const Legend(isVisible: true),
            series: <ChartSeries>[
              ColumnSeries<ExpenseStatModel, String>(
                  name: "Expenses",
                  dataSource: getExpenseStats(),
                  xValueMapper: (ExpenseStatModel stats, _) => stats.x,
                  yValueMapper: (ExpenseStatModel stats, _) => stats.y)
            ],
          ),
        ),
      ],
    );
  }
}
