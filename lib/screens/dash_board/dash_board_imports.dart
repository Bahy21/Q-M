import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/core/constants/dimens.dart';
import 'package:chatgpt_course/core/constants/gaps.dart';
import 'package:chatgpt_course/core/helpers/custom_toast.dart';
import 'package:chatgpt_course/core/helpers/di.dart';
import 'package:chatgpt_course/core/helpers/dio_factory.dart';
import 'package:chatgpt_course/core/helpers/global_state.dart';
import 'package:chatgpt_course/core/helpers/loading_helper.dart';
import 'package:chatgpt_course/core/helpers/utilities.dart';
import 'package:chatgpt_course/core/helpers/validator.dart';
import 'package:chatgpt_course/core/localization/localization_methods.dart';
import 'package:chatgpt_course/core/themes/app_text_style.dart';
import 'package:chatgpt_course/core/widgets/custom_decoration.dart';
import 'package:chatgpt_course/core/widgets/generic_text_field.dart';
import 'package:chatgpt_course/models/dash_board_model.dart';
import 'package:chatgpt_course/models/review_model.dart';
import 'package:chatgpt_course/models/user_model.dart';
import 'package:chatgpt_course/screens/dash_board/widgets/dash_board_w_imports.dart';
import 'package:chatgpt_course/screens/home/tabs/more/more_cubit/more_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/bloc/generic_cubit/generic_cubit.dart';

part 'dash_board.dart';
part 'dash_board_controller.dart';
