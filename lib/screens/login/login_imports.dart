// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatgpt_course/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:chatgpt_course/core/helpers/di.dart';
import 'package:chatgpt_course/core/helpers/get_device_id.dart';
import 'package:chatgpt_course/core/helpers/loading_helper.dart';
import 'package:chatgpt_course/core/themes/app_text_style.dart';
import 'package:chatgpt_course/models/user_model.dart';
import 'package:chatgpt_course/screens/home/home_imports.dart';
import 'package:chatgpt_course/screens/payment/payment_imports.dart';
import 'package:chatgpt_course/widgets/build_auth_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/login_widgets_imports.dart';

part 'login.dart';
part 'login_controller.dart';