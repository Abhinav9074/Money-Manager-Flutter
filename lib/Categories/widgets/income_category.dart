import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Categories/widgets/edit_category.dart';

class IncomeCategoryScreen extends StatelessWidget {
  const IncomeCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Slidable(
                  key: Key('$index'),
                  startActionPane: ActionPane(motion: const BehindMotion(), children: [
                    SlidableAction(
                      onPressed: (ctx) {},
                      icon: FontAwesomeIcons.trash,
                      autoClose: true,
                      backgroundColor: Colors.red,
                      label: 'Delete',
                      borderRadius: BorderRadius.circular(10),
                    )
                  ]),
                  endActionPane: ActionPane(motion: const BehindMotion(), children: [
                    SlidableAction(
                      onPressed: (ctx) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                          return const CategoryEditScreen();
                        }));
                      },
                      icon: FontAwesomeIcons.penToSquare,
                      autoClose: true,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Income${index + 1}',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'texgyreadventor-regular',
                                            fontWeight: FontWeight.w900,
                                            color:
                                                Color.fromARGB(255, 34, 194, 77))),
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
          itemCount: 10),
    );
  }
}
