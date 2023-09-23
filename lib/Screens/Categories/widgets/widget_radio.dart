import 'package:flutter/material.dart';
import 'package:money_manager/Screens/Categories/widgets/add_category.dart';
import 'package:money_manager/models/category_model.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;

  const  RadioButton({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedCategory,
            builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
              return Radio<CategoryType>(
                value: type,
                groupValue: newCategory,
                onChanged: (value) {
                  selectedCategory.value = value!;
                  selectedCategory.notifyListeners();
                },
              );
            }),
        Text(
          title,
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'texgyreadventor-regular',
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
