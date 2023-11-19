
import 'package:card_swiper/card_swiper.dart';
import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:chatgpt_course/core/constants/dimens.dart';
import 'package:chatgpt_course/core/constants/gaps.dart';
import 'package:chatgpt_course/core/helpers/get_device_id.dart';
import 'package:chatgpt_course/core/localization/localization_methods.dart';
import 'package:chatgpt_course/core/themes/app_text_style.dart';
import 'package:chatgpt_course/core/widgets/custom_decoration.dart';
import 'package:chatgpt_course/models/dash_board_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'home_main.dart';
part 'home_main_controller.dart';