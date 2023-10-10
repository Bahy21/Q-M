import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/core/constants/dimens.dart';
import 'package:chatgpt_course/core/helpers/di.dart';
import 'package:chatgpt_course/core/helpers/loading_helper.dart';
import 'package:chatgpt_course/core/helpers/validator.dart';
import 'package:chatgpt_course/core/localization/localization_methods.dart';
import 'package:chatgpt_course/core/widgets/generic_text_field.dart';
import 'package:chatgpt_course/models/review_model.dart';
import 'package:chatgpt_course/screens/home/tabs/more/more_cubit/more_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/gaps.dart';
import '../../core/themes/app_text_style.dart';

part 'review_controller.dart';
part 'review.dart';