import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_tutorial/core/bloc/generic_cubit/generic_cubit.dart';
import 'package:login_tutorial/core/constants/dimens.dart';
import 'package:login_tutorial/core/constants/gaps.dart';
import 'package:login_tutorial/core/helpers/di.dart';
import 'package:login_tutorial/core/helpers/loading_helper.dart';
import 'package:login_tutorial/core/themes/app_text_style.dart';
import 'package:login_tutorial/features/auth/presentation/widgets/build_auth_app_bar.dart';
import 'package:login_tutorial/features/home/presentaion/pages/home/home_imports.dart';
import 'package:login_tutorial/res.dart';

import 'widgets/login_widgets_imports.dart';

part 'login.dart';
part 'login_controller.dart';