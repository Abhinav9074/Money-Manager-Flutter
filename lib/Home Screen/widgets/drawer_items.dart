import 'package:flutter/material.dart';
import 'package:money_manager/dummy.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  PhysicalModel(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    elevation: 8.0,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('User Name',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Raleway-VariableFont_wght',
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                                return Dummy();
                              }));
                            },
                              child: const Text(
                            'Deleted Transactions',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'texgyreadventor-regular',
                                color: Color.fromARGB(255, 130, 129, 129)),
                          )),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: (){},
                              child: const Text('Faq',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'texgyreadventor-regular',
                                      color:
                                          Color.fromARGB(255, 130, 129, 129)))),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: (){},
                              child: const Text('Privacy Policy',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'texgyreadventor-regular',
                                      color:
                                          Color.fromARGB(255, 130, 129, 129))))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}