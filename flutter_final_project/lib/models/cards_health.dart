import 'package:flutter/material.dart';

class CardsHealth extends StatefulWidget {
  final String title;
  final Icon icon;

  const CardsHealth({super.key, required this.title, required this.icon});

  @override
  State<CardsHealth> createState() => _CardsHealthState();
}

class _CardsHealthState extends State<CardsHealth> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 30, bottom: 18, right: 2),
              child: Row(
                children: [
                  widget.icon,
                  Text(widget.title),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.cyanAccent),
              height: 200,
              width: 350,
            )
          ],
        ),
      ),
    );
  }
}
