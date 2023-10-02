import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/models/category_model.dart';
import 'package:money_manager/models/transactions_model.dart';

// ignore: constant_identifier_names
const TRANSACTION_DB_NAME = 'transaction-database';

abstract class TransactionDetails {
  Future<void> addTransactions(TransactionModel values);
  Future<List<TransactionModel>> getTransactions();
  Future<void> deleteTransaction(value);
  Future<void> findSpeciificTransaction(value, String id);
  Future<void> FilterByDate(DateTime start, DateTime end);
}

class TransactionDb implements TransactionDetails {
  TransactionDb._internal();

  static TransactionDb instance = TransactionDb._internal();

  factory TransactionDb() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> incomeTransactionsList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> expenseTransactionsList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> allTransactionsList = ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> specificTransactionsList =
      ValueNotifier([]);

  @override
  Future<void> addTransactions(TransactionModel values) async {
    final transactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await transactionDb.put(values.id, values);
    refreshUI();
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final transactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return transactionDb.values.toList();
  }

  Future<void> refreshUI() async {
    final allTransactions = await getTransactions();
    expenseTransactionsList.value.clear();
    incomeTransactionsList.value.clear();
    allTransactionsList.value.clear();
    await Future.forEach(allTransactions, (TransactionModel transactions) {
      if (transactions.type == CategoryType.income) {
        incomeTransactionsList.value.add(transactions);
      } else {
        expenseTransactionsList.value.add(transactions);
      }
      allTransactionsList.value.add(transactions);
    });
    expenseTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    incomeTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    allTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    expenseTransactionsList.notifyListeners();
    incomeTransactionsList.notifyListeners();
    allTransactionsList.notifyListeners();
  }

  Future<void> searchTransactions(String text) async {
    final allTransactions = await getTransactions();
    expenseTransactionsList.value.clear();
    incomeTransactionsList.value.clear();
    allTransactionsList.value.clear();
    await Future.forEach(allTransactions, (TransactionModel transactions) {
      String searchText = transactions.purpose;
      searchText.toLowerCase();
      text.toLowerCase();
      if (transactions.type == CategoryType.income &&
          transactions.purpose.toLowerCase().contains(text)) {
        incomeTransactionsList.value.add(transactions);
        allTransactionsList.value.add(transactions);
      } else if ((transactions.type == CategoryType.expense &&
          transactions.purpose.toLowerCase().contains(text))) {
        expenseTransactionsList.value.add(transactions);
        allTransactionsList.value.add(transactions);
      }
    });
    expenseTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    incomeTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    allTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    expenseTransactionsList.notifyListeners();
    incomeTransactionsList.notifyListeners();
    allTransactionsList.notifyListeners();
  }

  @override
  Future<void> findSpeciificTransaction(value, String id) async {
    final specificTransactions = await getTransactions();
    specificTransactionsList.value.clear();

    await Future.forEach(specificTransactions, (TransactionModel transactions) {
      if (transactions.categorySubType == value && transactions.id != id) {
        specificTransactionsList.value.add(transactions);
      }
    });
    specificTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    specificTransactionsList.notifyListeners();
  }

  @override
  Future<void> deleteTransaction(value) async {
    final transactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await transactionDb.delete(value);
    refreshUI();
  }

  @override
  Future<void> FilterByDate(DateTime start, DateTime end) async {
    final allTransactions = await getTransactions();
    expenseTransactionsList.value.clear();
    incomeTransactionsList.value.clear();
    allTransactionsList.value.clear();

    await Future.forEach(allTransactions, (TransactionModel transactions) {
      if (transactions.type == CategoryType.income&&transactions.date.isAfter(start)&&transactions.date.isBefore(end)) {
        incomeTransactionsList.value.add(transactions);
        
        
      } else if(transactions.type == CategoryType.expense&&transactions.date.isAfter(start)&&transactions.date.isBefore(end)) {
        expenseTransactionsList.value.add(transactions);
        
      }

        if(transactions.date.isAfter(start)&&transactions.date.isBefore(end)){
          allTransactionsList.value.add(transactions);

        }

        if(transactions.type == CategoryType.expense&&transactions.date==start||transactions.date==end){
          expenseTransactionsList.value.add(transactions);
        }
        if(transactions.type == CategoryType.income&&transactions.date==start||transactions.date==end){
          incomeTransactionsList.value.add(transactions);
        } 
        if(transactions.date==start||transactions.date==end){
          allTransactionsList.value.add(transactions);
        }
    });

    expenseTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    incomeTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));
    allTransactionsList.value
        .sort((first, second) => second.date.compareTo(first.date));

    expenseTransactionsList.notifyListeners();
    incomeTransactionsList.notifyListeners();
    allTransactionsList.notifyListeners();
  }
}
