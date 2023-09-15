import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PhysicalModel(
                shape: BoxShape.circle,
                color: Colors.black,
                elevation: 8.0,
                child: InkWell(
                  onTap: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child: ClipOval(
                    child: Image.asset('assets/images/profile.png',width: 50,),
                    ),
                ),
              ),
              const SizedBox(width: 20,),
              const Text('Hi User',style: TextStyle(fontSize: 25,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.w600),)
                ],
              ),
              IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.black,size: 30,)),
            ],
          ),
        ),
      ),
      // child: ListTile(
      //   leading: Image.asset('assets/images/profile.png',width: 100,height: 100,),
      //   trailing: IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.black,size: 30,)),
      // ),
    );
  }
  
  @override
  Size get preferredSize => const Size(
    double.maxFinite,
    100
  );
}

