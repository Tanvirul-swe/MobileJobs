import 'package:flutter/material.dart';

const general = <String>[
  'Email',
  'Phone',
  'Gender',
  'Date of Birth',
  'Permanent Address',
  'NID Verification',
];
class GetUserData{
  String name;
  String email;
  String phone;
  String gender;
  String birthday;
  String present_address;
  String nid_verifycheck;

  GetUserData(this.name, this.email, this.phone, this.gender, this.birthday,
      this.present_address, this.nid_verifycheck);


}