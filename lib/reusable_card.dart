import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  Color colour = Color(0XFFEDEDED);
  Widget cardChild = Row(children: [Text('Prueba')]);
  EdgeInsets cardMargin = EdgeInsets.all(10);

  ReusableCard({required this.cardChild});
  ReusableCard.pruebas({required this.colour});
  ReusableCard.all({required this.colour, required this.cardChild, required this.cardMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cardMargin,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 3),
            blurRadius: 6,
          ),
        ],
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}
