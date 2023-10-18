

import 'dart:developer';

import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:chatgpt_course/core/constants/enums.dart';
import 'package:chatgpt_course/core/constants/gaps.dart';
import 'package:chatgpt_course/core/helpers/get_device_id.dart';
import 'package:chatgpt_course/core/localization/localization_methods.dart';
import 'package:chatgpt_course/core/themes/app_text_style.dart';
import 'package:chatgpt_course/models/user_model.dart';
import 'package:chatgpt_course/res.dart';
import 'package:chatgpt_course/screens/home/home_imports.dart';
import 'package:chatgpt_course/screens/payment/widgets/payment_w_imports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


part 'payment.dart';
part 'payment_controller.dart';