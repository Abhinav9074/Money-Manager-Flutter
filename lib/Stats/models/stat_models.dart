class IncomeStatModel{
  String x;
  double y;

  IncomeStatModel(this.x, this.y);

}

getIncomeStats(){
  List<IncomeStatModel>IncomeStatList=[
    IncomeStatModel("Salary", 40000.00),
    IncomeStatModel("Asset Income", 14000.00),
    IncomeStatModel("Trading Profit", 7000.00),
    IncomeStatModel("Miscellaneous Income", 1800.00),
  ];
  return IncomeStatList;
}



class ExpenseStatModel{
  String x;
  double y;

  ExpenseStatModel(this.x, this.y);

}

getExpenseStats(){
  List<ExpenseStatModel>IncomeStatList=[
    ExpenseStatModel("Travel", 8000.00),
    ExpenseStatModel("Food", 10000.00),
    ExpenseStatModel("Shopping", 6000.00),
    ExpenseStatModel("Miscellaneous", 2000.00),
  ];
  return IncomeStatList;
}