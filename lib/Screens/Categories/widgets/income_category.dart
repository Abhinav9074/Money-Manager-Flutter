import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Screens/categories/widgets/edit_category.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/models/category_model.dart';

class IncomeCategoryScreen extends StatelessWidget {
  const IncomeCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDb().incomeCategoryList,
        builder: (BuildContext ctx, List<CategoryModel> incomeList, Widget? _) {
          return SlidableAutoCloseBehavior(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final data = incomeList[index];
                  return Column(
                    children: [
                      if (!data.isDeleted)
                        Slidable(
                          key: Key('$index'),
                          startActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (ctx) {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            content: const Text(
                                                'The Data Will Be Deleted'),
                                            title: const Text('Are You Sure'),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(Icons.close)),
                                                  IconButton(
                                                    onPressed: () async {
                                                      CategoryDb()
                                                          .deleteCategory(
                                                              data.id);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                          'Deleted Successfully',
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        padding:
                                                            EdgeInsets.all(20),
                                                      ));
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    icon: const Icon(Icons.check),
                                                  )
                                                ],
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: FontAwesomeIcons.trash,
                                  autoClose: true,
                                  backgroundColor: Colors.red,
                                  label: 'Delete',
                                  borderRadius: BorderRadius.circular(10),
                                )
                              ]),
                          endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (ctx) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return CategoryEditScreen(
                                          categoryName: data.categoryName,
                                          categoryType: data.type,
                                          CategoryId: data.id);
                                    }));
                                  },
                                  icon: FontAwesomeIcons.penToSquare,
                                  autoClose: true,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.blue,
                                  label: 'Edit',
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: PhysicalModel(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(40),
                              elevation: 6.0,
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data.categoryName,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontFamily:
                                                        'texgyreadventor-regular',
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        1000, 0, 128, 0))),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemCount: incomeList.length),
          );
        });
  }
}
