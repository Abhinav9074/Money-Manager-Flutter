import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/models/category_model.dart';
import 'package:money_manager/models/transactions_model.dart';

Future<void>InitDb()async{
  await Hive.initFlutter();

  if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId))
  {
    Hive.registerAdapter(CategoryTypeAdapter());
  }


  if(!Hive.isAdapterRegistered(CategoryModelAdapter().typeId))
  {
    Hive.registerAdapter(CategoryModelAdapter());
  }

if(!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)){
  Hive.registerAdapter(TransactionModelAdapter());
}

}