
import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:chatgpt_course/core/constants/dimens.dart';
import 'package:chatgpt_course/core/constants/gaps.dart';
import 'package:chatgpt_course/core/helpers/validator.dart';
import 'package:chatgpt_course/core/localization/localization_methods.dart';
import 'package:chatgpt_course/core/widgets/generic_text_field.dart';
import 'package:chatgpt_course/models/user_model.dart';
import 'package:chatgpt_course/screens/home/tabs/more/widgets/more_w_imports.dart';
import 'package:chatgpt_course/screens/register/register_imports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'build_register_form.dart';
part'build_register_btn.dart';
