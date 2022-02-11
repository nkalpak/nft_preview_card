import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Outfit'),
      home: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          color: CustomColors.veryDarkBlueMain,
          child: NftCardWrapper(
            children: [
              ClipRRect(
                child: Image.asset('assets/images/image-equilibrium.jpg'),
                borderRadius: BorderRadius.circular(12),
              ),
              SizedBox(height: 20),
              Text(
                'Equilibrium #3429',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Our Equilibrium collection promotes balance and calm.',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: CustomColors.softBlue,
                    fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CurrencyLabel(
                      label: 'ETH',
                      value: 0.041,
                      icon:
                          SvgPicture.asset('assets/images/icon-ethereum.svg')),
                  Spacer(),
                  IconLabel(
                      icon: Icon(
                        Icons.access_time_filled,
                        color: CustomColors.softBlue,
                      ),
                      label: Text(
                        '3 days left',
                        style: TextStyle(
                            fontSize: 18, color: CustomColors.softBlue),
                      ))
                ],
              ),
              SizedBox(height: 8),
              Divider(
                color: CustomColors.softBlue,
              ),
              SizedBox(height: 8),
              IconLabel(
                  icon: Container(
                    child: CircleAvatar(
                      foregroundImage:
                          AssetImage('assets/images/image-avatar.png'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: Colors.white70)),
                  ),
                  label: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                              text: 'Creation of ',
                              style: TextStyle(color: CustomColors.softBlue)),
                          TextSpan(text: 'Jules Wyvern')
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class NftCardWrapper extends StatelessWidget {
  final List<Widget> children;

  NftCardWrapper({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: CustomColors.veryDarkBlueCard,
        child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )));
  }
}

/*
* 1. How to propagate color to multiple (different) elements down the tree?
* Imagine that we have a parent Wrapper and two children, an Icon and a Text.
* How do we specify the color of *both* the Icon and the Text via the Wrapper,
* and have them inherit the color?
*
*
* */

class IconLabel extends StatelessWidget {
  final Widget icon, label;

  const IconLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [icon, SizedBox(width: 8), label],
    );
  }
}

class CurrencyLabel extends StatelessWidget {
  final String label;
  final double value;
  final Widget icon;

  const CurrencyLabel(
      {Key? key, required this.label, required this.value, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconLabel(
        icon: icon,
        label: Text(
          '$value ${label.toUpperCase()}',
          style: TextStyle(
              color: HSLColor.fromAHSL(1.0, 178, 1.0, 0.5).toColor(),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ));
  }
}

class CustomColors {
  static Color cyan = const HSLColor.fromAHSL(1.0, 187, 1.0, 0.5).toColor();
  static Color softBlue =
      const HSLColor.fromAHSL(1.0, 215, 0.51, 0.7).toColor();
  static Color veryDarkBlueMain =
      const HSLColor.fromAHSL(1.0, 217, 0.54, 0.11).toColor();
  static Color veryDarkBlueCard =
      const HSLColor.fromAHSL(1.0, 216, 0.5, 0.16).toColor();
  static Color veryDarkBlueLine =
      const HSLColor.fromAHSL(1.0, 215, 0.32, 0.27).toColor();
}
