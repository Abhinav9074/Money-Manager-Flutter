import 'package:flutter/material.dart';
import 'package:money_manager/DeletedTransactions/screens/deleted_transactions.dart';
import 'package:money_manager/Faq/screens/faq_screen.dart';
import 'package:money_manager/PrivacyPolicy/privacy_policy_screen.dart';
import 'package:money_manager/ProfileEditScreen/screens/profile_edit_screen.dart';
import 'package:money_manager/TermsAndCondition/terms_and_conditions.dart';

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
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const ProfileEditScreen();
                  }));
                },
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png',
                    height: 150,
                    width: 150,
                  ),
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
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return const DeletedTransactions();
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
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return const FaqScreen();
                          }));
                        },
                        child: const Text('Faq',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'texgyreadventor-regular',
                                color: Color.fromARGB(255, 130, 129, 129)))),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return const PrivacyPolicyScreen();
                          }));
                        },
                        child: const Text('Privacy Policy',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'texgyreadventor-regular',
                                color: Color.fromARGB(255, 130, 129, 129)))),
                                const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return const TermsAndConditionsScreen();
                          }));
                        },
                        child: const Text('Terms and Conditions',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'texgyreadventor-regular',
                                color: Color.fromARGB(255, 130, 129, 129))))
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
