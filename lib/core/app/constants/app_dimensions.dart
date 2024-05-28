import 'package:flutter/material.dart';

// Dimensions to use throughout the app
const double kHBox0 = 5.0;
const double kHBox1 = 10.0;
const double kHBox2 = 20.0;
const double kHBox3 = 30.0;
const double kHBox4 = 40.0;

const SizedBox kHSizedBox0 = SizedBox(width: kHBox0);
const SizedBox kHSizedBox1 = SizedBox(width: kHBox1);
const SizedBox kHSizedBox2 = SizedBox(width: kHBox2);
const SizedBox kHSizedBox3 = SizedBox(width: kHBox3);
const SizedBox kHSizedBox4 = SizedBox(width: kHBox4);

const double kVBox0 = 5.0;
const double kVBox1 = 10.0;
const double kVBox2 = 20.0;
const double kVBox3 = 30.0;
const double kVBox4 = 40.0;

const SizedBox kVSizedBox0 = SizedBox(height: kVBox0);
const SizedBox kVSizedBox1 = SizedBox(height: kVBox1);
const SizedBox kVSizedBox2 = SizedBox(height: kVBox2);
const SizedBox kVSizedBox3 = SizedBox(height: kVBox3);
const SizedBox kVSizedBox4 = SizedBox(height: kVBox4);

//only use it inside the widget body for responsive height
appHeight(BuildContext context) => MediaQuery.of(context).size.height;

//only use it inside the widget body for responsive width
appWidth(BuildContext context) => MediaQuery.of(context).size.width;
