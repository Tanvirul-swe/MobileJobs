import 'package:flutter/material.dart';
const KWorkCategory =  BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(5),
      topRight: Radius.circular(5),
      bottomLeft: Radius.circular(5),
      bottomRight: Radius.circular(5)
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 1,
      offset: Offset(0, 1),

    ),
  ],
);