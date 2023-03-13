import 'package:flutter/material.dart';

appBar() {
  return Row(
    children: [
      Column(
        children: [
          Text(
            "aplanet",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white.withOpacity(0.65),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "We Love the Planet",
            style: TextStyle(
              fontSize: 10,
              color: Colors.white.withOpacity(0.75),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      const Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.white.withOpacity(0.75),
        ),
      )
    ],
  );
}