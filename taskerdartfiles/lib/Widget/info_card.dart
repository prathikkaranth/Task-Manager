import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  final String ln;
  final String imp;
  Function dispLst;

  InfoCard(this.ln, this.imp, this.dispLst);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => widget.dispLst(0),
          child: Card(
            color: Colors.blue,
            child: Container(
                width: 175,
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 28,
                      color: Colors.white,
                    ),
                    Text(
                      ' Total : ${widget.ln}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
          ),
        ),
        InkWell(
          onTap: () => widget.dispLst(1),
          child: Card(
            color: Colors.orange,
            child: Container(
                width: 220,
                height: 69,
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.label_important,
                      size: 28,
                      color: Colors.white,
                    ),
                    Text(
                      ' Important : ${widget.imp}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
