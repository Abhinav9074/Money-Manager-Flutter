import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Categories/widgets/add_category.dart';
import 'package:money_manager/Categories/widgets/expense_category.dart';
import 'package:money_manager/Categories/widgets/income_category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 235, 235),
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'texgyreadventor-regular',
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 232, 235, 235),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              TabBar(
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 20, fontFamily: 'texgyreadventor-regular'),
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: const [
                   
                    Tab(
                      text: 'Income',
                    ),
                    Tab(
                      text: 'Expense',
                    ),
                  ]),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                  IncomeCategoryScreen(),
                  ExpenseCategoryScreen()
                ]),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: CircleAvatar(
              minRadius: 30,
              backgroundColor: Colors.black,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return const CategoryAddScreen();
                    }));
                  },
                  icon: const FaIcon(FontAwesomeIcons.plus)),
            ),
          ),
        ],
      ),
    );
  }
}
