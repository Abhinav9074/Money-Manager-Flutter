import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/models/category_model.dart';

const CATEGORY_DB_NAME ='category-database';

abstract class CategoryDbFunctions{
  Future<List<CategoryModel>>getCategories();
  Future<void>insertCategory(CategoryModel value);


}

class CategoryDb implements CategoryDbFunctions{

  CategoryDb._internal();

  static CategoryDb instance = CategoryDb._internal();

  factory CategoryDb(){
    return instance;
  }

  ValueNotifier<List<CategoryModel>>incomeCategoryList= ValueNotifier([]);
  ValueNotifier<List<CategoryModel>>expenseCategoryList= ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async{
    final _categoryDb = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    print(value.categoryName);
    await _categoryDb.put(value.id,value);
    refreshUI();     
  }
  
  @override
  Future<List<CategoryModel>> getCategories() async{
    final _categoryDb = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDb.values.toList();
  }

  Future<void>refreshUI()async{
    final _allCategories = await getCategories();
    incomeCategoryList.value.clear();
    expenseCategoryList.value.clear();
    await Future.forEach(_allCategories, (CategoryModel category){
      if(category.type == CategoryType.income){
        incomeCategoryList.value.add(category);
      }else{
        expenseCategoryList.value.add(category);
      }
    });
    incomeCategoryList.notifyListeners();
    expenseCategoryList.notifyListeners();

  }
  




}