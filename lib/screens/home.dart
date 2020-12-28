import 'package:flutter/material.dart';
import 'package:monhun_random/functionals/option_descriptor.dart';
import 'package:monhun_random/screens/customized.dart';
import 'package:monhun_random/screens/weapon.dart';

class Home extends StatelessWidget {

  final List<GivenOption> menuItems = [
    GivenOption(name: 'Weapon Randomizer', iconPath: 'assets/weapon_icons.jpg', routeName: '/weapon'),
    GivenOption(name: 'Customized Randomizer', iconPath: 'assets/weapon_icons.jpg', routeName: '/customized'),
    GivenOption(name: 'Functioning Spinner', iconPath: 'assets/roulette-8-300.png', routeName: '/spinwheel'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Monster Hunter Randomizer')),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, menuItems[index].routeName);
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  menuItems[index].iconPath
                ),
              ),
              title: Text(menuItems[index].name)
            ),
          );
        },

      )
    );
  }
}
