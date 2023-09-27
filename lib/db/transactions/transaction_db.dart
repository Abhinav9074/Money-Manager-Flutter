import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/models/category_model.dart';
import 'package:money_manager/models/transactions_model.dart';

const TRANSACTION_DB_NAME = 'transaction-database';

abstract class TransactionDetails {
  Future<void> addTransactions(TransactionModel values);
  Future<List<TransactionModel>> getTransactions();
  Future<void>deleteTransaction(value);
}

class TransactionDb implements TransactionDetails {
  TransactionDb._internal();

  static TransactionDb instance = TransactionDb._internal();

  factory TransactionDb() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> incomeTransactionsList= ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> expenseTransactionsList= ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> allTransactionsList= ValueNotifier([]);

  @override
  Future<void> addTransactions(TransactionModel values) async {
    final _transactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _transactionDb.put(values.id, values);
    refreshUI();
  }

  @override
  Future<List<TransactionModel>> getTransactions() async{
    final _transactionDb = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _transactionDb.values.toList();
  }

  Future<void>refreshUI()async{
    final _allTransactions = await  getTransactions();
    expenseTransactionsList.value.clear();
    incomeTransactionsList.value.clear();
    allTransactionsList.value.clear();
    await Future.forEach(_allTransactions, (TransactionModel transactions){
      if(transactions.type==CategoryType.income){
        incomeTransactionsList.value.add(transactions);
      }else{
        expenseTransactionsList.value.add(transactions);
      }
      allTransactionsList.value.add(transactions);
    });
    expenseTransactionsList.value.sort((first,second)=> second.date.compareTo(first.date));
    incomeTransactionsList.value.sort((first,second)=> second.date.compareTo(first.date));
    allTransactionsList.value.sort((first,second)=> second.date.compareTo(first.date));
    expenseTransactionsList.notifyListeners();
    incomeTransactionsList.notifyListeners();
    allTransactionsList.notifyListeners();
  }


  Future<void>searchTransactions(String text)async{
    final _allTransactions = await  getTransactions();
    expenseTransactionsList.value.clear();
    incomeTransactionsList.value.clear();
    allTransactionsList.value.clear();
    await Future.forEach(_allTransactions, (TransactionModel transactions){
      String searchText =transactions.purpose;
      searchText.toLowerCase();
      text.toLowerCase();
      if(transactions.type==CategoryType.income&&transactions.purpose.toLowerCase().contains(text)){
        incomeTransactionsList.value.add(transactions);
        allTransactionsList.value.add(transactions);
      }else if((transactions.type==CategoryType.expense&&transactions.purpose.toLowerCase().contains(text))){
        expenseTransactionsList.value.add(transactions);
        allTransactionsList.value.add(transactions);
      }
      
    });
    expenseTransactionsList.value.sort((first,second)=> second.date.compareTo(first.date));
    incomeTransactionsList.value.sort((first,second)=> second.date.compareTo(first.date));
    allTransactionsList.value.sort((first,second)=> second.date.compareTo(first.date));
    expenseTransactionsList.notifyListeners();
    incomeTransactionsList.notifyListeners();
    allTransactionsList.notifyListeners();
  }
  
  @override
  Future<void> deleteTransaction(value) async{
    final _transactionDb = await  Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _transactionDb.delete(value);
    refreshUI();
  }
}
