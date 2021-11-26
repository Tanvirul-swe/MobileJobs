import 'package:flutter/material.dart';
class SelectServices extends StatefulWidget {
  @override
  SelectServicesState createState() => new SelectServicesState();
}

class SelectServicesState extends State<SelectServices> {
  Map<String, bool> values = {
    'Wall Painter': true,
    'Car Rental': false,
    'Electrician': false,
    'Car Cleaning': false,
    'Truck Rent': false,
    'Ambulance Service': false,
    'Desktop Service': false,
    'Laptop Service': false,
    'House Clean': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: ListView(
        children: values.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: values[key],
            onChanged: (bool ?value) {
              setState(() {
                values[key] = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}