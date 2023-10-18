import 'dart:convert';

import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:chatgpt_course/core/constants/gaps.dart';
import 'package:chatgpt_course/core/helpers/di.dart';
import 'package:chatgpt_course/core/helpers/utilities.dart';
import 'package:chatgpt_course/core/localization/localization_methods.dart';
import 'package:chatgpt_course/core/themes/app_text_style.dart';
import 'package:chatgpt_course/screens/login/login_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'select_lang.dart';
part 'select_lang_controller.dart';