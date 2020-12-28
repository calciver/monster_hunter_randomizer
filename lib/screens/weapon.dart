import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

class Weapon extends StatelessWidget {

  final StreamController _dividerController = StreamController<int>();

  final _wheelNotifier = StreamController<double>();

  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weapon Randomizer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset('assets/weapon_roulette.png'),
              width: 410,
              height: 410,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.6,
              canInteractWhileSpinning: false,
              dividers: 14,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
              secondaryImage:
              Image.asset('assets/roulette-center-300.png'),
              secondaryImageHeight: 110,
              secondaryImageWidth: 110,
              shouldStartOrStop: _wheelNotifier.stream,
            ),
            SizedBox(height: 30),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
              snapshot.hasData ? WeaponChoice(snapshot.data) : Container(),
            ),
            SizedBox(height: 30),
            new RaisedButton(
              child: new Text("Start"),
              onPressed: () =>
                  _wheelNotifier.sink.add(_generateRandomVelocity()),
            )
          ],
        ),
      ),
    );
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;

}

class WeaponChoice extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: 'Great Sword',
    2: 'Long Sword',
    3: 'Hammer',
    4: 'Hunting Horn',
    5: 'Lance',
    6: 'Gunlance',
    7: 'Switch Axe',
    8: 'Charge Blade',
    9: 'Insect Glaive',
    10: 'Light Bowgun',
    11: 'Heavy Bowgun',
    12: 'Bow',
    13: 'Sword and Shield',
    14: 'Dual Blades',
  };

  WeaponChoice(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}