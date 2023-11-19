import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/core/constants/dimens.dart';
import 'package:chatgpt_course/core/helpers/di.dart';
import 'package:chatgpt_course/core/helpers/get_device_id.dart';
import 'package:chatgpt_course/core/helpers/utilities.dart';
import 'package:chatgpt_course/core/themes/app_text_style.dart';
import 'package:chatgpt_course/core/widgets/custom_decoration.dart';
import 'package:chatgpt_course/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'build_more_item.dart';
part 'build_lang_bottom_sheet.dart';