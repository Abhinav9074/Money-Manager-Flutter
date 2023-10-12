
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';

class IncomeData{
  final String incomeSource;
  final int amount;

  IncomeData({required this.incomeSource, required this.amount});
}
ValueNotifier<List<IncomeData>> IncomeChartDataNotifier = ValueNotifier([]);
void getIncomeChartData(){ 
  int i=0,sum=0;
  IncomeChartDataNotifier.value.clear();
  while(i<CategoryDb().incomeCategoryList.value.length){
    sum=0;
    for (var element in TransactionDb().allTransactionsList.value) {
      if(CategoryDb().incomeCategoryList.value[i].categoryName==element.categorySubType){
        
        sum=sum+int.parse(element.amount);
      }
    }
    IncomeChartDataNotifier.value.add(IncomeData(incomeSource: CategoryDb().incomeCategoryList.value[i].categoryName, amount: sum));
    i++;
  }
  IncomeChartDataNotifier.notifyListeners();
}







class ExpenseData{
  final String expenseSource;
  final int amount;

  ExpenseData({required this.expenseSource, required this.amount});
}

ValueNotifier<List<ExpenseData>> ExpenseChartDataNotifier = ValueNotifier([]);
void getExpenseChartData(){
  int i=0,sum=0;
  ExpenseChartDataNotifier.value.clear();
  while(i<CategoryDb().expenseCategoryList.value.length){
    sum=0;
    for (var element in TransactionDb().allTransactionsList.value) {
      if(CategoryDb().expenseCategoryList.value[i].categoryName==element.categorySubType){
        
        sum=sum+int.parse(element.amount);
      }
    }
    ExpenseChartDataNotifier.value.add(ExpenseData(expenseSource: CategoryDb().expenseCategoryList.value[i].categoryName, amount: sum));
    i++;
  }
  ExpenseChartDataNotifier.notifyListeners();
}